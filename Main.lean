import Leanlings

open Leanlings

def showHelp : IO Unit := do
  IO.println "Usage: lake exe leanlings [command]\n"
  IO.println "Commands:"
  IO.println "  (none)       Show current exercise and status"
  IO.println "  run          Check the current exercise"
  IO.println "  run <name>   Check a specific exercise"
  IO.println "  watch        Watch mode — auto-check on file changes"
  IO.println "  verify       Check all exercises"
  IO.println "  hint         Show a hint for the current exercise"
  IO.println "  list         List all exercises with status"
  IO.println "  next         Move to the next exercise"
  IO.println "  reset        Reset the current exercise (requires git)"
  IO.println "  reset <name> Reset a specific exercise"
  IO.println "  help         Show this help"

def showStatus : IO Unit := do
  let state ← AppState.load Config.exercises
  let done := state.countDone
  let total := Config.exercises.size
  IO.println s!"\n{UI.bold "Leanlings"} — Learn Lean 4 one exercise at a time\n"
  IO.println (UI.progressBar done total)
  IO.println ""
  if done == 0 then
    IO.println Config.welcomeMessage
  if state.allDone Config.exercises then
    IO.println Config.finalMessage
  else
    match Config.getExercise state.currentExercise with
    | some ex =>
      IO.println s!"Current exercise: {UI.bold ex.name}"
      IO.println s!"  → {ex.path}"
      IO.println ""
      IO.println "Open this file in your editor and follow the instructions!"
      IO.println "Then run: lake exe leanlings run"
    | none =>
      IO.println s!"Error: exercise '{state.currentExercise}' not found"

def runExercise (name : String) : IO UInt32 := do
  match Config.getExercise name with
  | some ex =>
    IO.println s!"Checking {UI.bold ex.name}...\n"
    let status ← Runner.checkExercise ex
    Runner.displayResult ex status
    match status with
    | .success =>
      let state ← AppState.load Config.exercises
      let state := state.markCompleted name
      state.save
      IO.println s!"\n{UI.progressBar state.countDone Config.exercises.size}"
      IO.println s!"\nRun `lake exe leanlings next` to continue."
      return 0
    | _ => return 1
  | none =>
    IO.println s!"{UI.red "Error"}: exercise '{name}' not found"
    return 1

def runCurrent : IO UInt32 := do
  let state ← AppState.load Config.exercises
  runExercise state.currentExercise

def showHint : IO Unit := do
  let state ← AppState.load Config.exercises
  match Config.getExercise state.currentExercise with
  | some ex =>
    IO.println s!"\n{UI.cyan "Hint"} for {UI.bold ex.name}:\n"
    IO.println ex.hint
  | none =>
    IO.println "Error: current exercise not found"

def listExercises : IO Unit := do
  let state ← AppState.load Config.exercises
  IO.println s!"\n{UI.bold "Exercises"}:\n"
  for ex in Config.exercises do
    let marker := if state.isCompleted ex.name then UI.green "✓"
                  else if state.currentExercise == ex.name then UI.yellow "→"
                  else "  "
    IO.println s!" {marker} {ex.name}"
  IO.println ""
  IO.println (UI.progressBar state.countDone Config.exercises.size)

def nextExercise : IO Unit := do
  let state ← AppState.load Config.exercises
  if !state.isCompleted state.currentExercise then
    IO.println s!"{UI.yellow "!"} Warning: current exercise '{state.currentExercise}' is not yet completed."
    IO.println "  Skipping to next exercise anyway."
  let idx := Config.exercises.findIdx? (·.name == state.currentExercise)
  match idx with
  | some i =>
    if i + 1 < Config.exercises.size then
      let next := Config.exercises[i + 1]!
      let state := { state with currentExercise := next.name }
      state.save
      IO.println s!"Current exercise: {UI.bold next.name}"
      IO.println s!"  → {next.path}"
    else
      IO.println "You're already on the last exercise!"
  | none =>
    IO.println "Error: could not find current exercise"

def resetExercise (name : String) : IO UInt32 := do
  match Config.getExercise name with
  | some ex =>
    let result ← IO.Process.output {
      cmd := "git"
      args := #["checkout", "--", ex.path.toString]
    }
    if result.exitCode == 0 then
      IO.println s!"{UI.green "✓"} Reset {ex.name} to original state"
      return 0
    else
      IO.println s!"{UI.red "Error"}: Could not reset. Make sure you're in a git repository."
      IO.println s!"  You can manually look at solutions/{ex.dir}/{ex.name}.lean"
      return 1
  | none =>
    IO.println s!"{UI.red "Error"}: exercise '{name}' not found"
    return 1

def verifyAll : IO UInt32 := do
  IO.println s!"\n{UI.bold "Verifying all exercises"}...\n"
  let mut doneCount : Nat := 0
  let mut state := { (← AppState.load Config.exercises) with completed := #[] }
  for ex in Config.exercises do
    let status ← Runner.checkExercise ex
    match status with
    | .success =>
      IO.println s!"  {UI.green "✓"} {ex.name}"
      doneCount := doneCount + 1
      state := state.markCompleted ex.name
    | .compileError _ =>
      IO.println s!"  {UI.red "✗"} {ex.name}"
    | .hasSorry =>
      IO.println s!"  {UI.yellow "!"} {ex.name}"
  state.save
  IO.println s!"\n{UI.progressBar doneCount Config.exercises.size}"
  if doneCount == Config.exercises.size then
    IO.println s!"\n{Config.finalMessage}"
  else
    IO.println s!"\n{doneCount}/{Config.exercises.size} exercises completed."
  return 0

partial def watchLoop (state : AppState) (lastContent : String) (firstRun : Bool) : IO UInt32 := do
  if state.allDone Config.exercises then
    IO.print UI.clearScreen
    IO.println Config.finalMessage
    return 0
  match Config.getExercise state.currentExercise with
  | some ex =>
    let content ← IO.FS.readFile ex.path
    if content != lastContent || firstRun then
      IO.print UI.clearScreen
      IO.println s!"{UI.bold "Leanlings"} — Watch Mode\n"
      IO.println s!"{UI.progressBar state.countDone Config.exercises.size}\n"
      IO.println s!"Checking {UI.bold ex.name}...\n"
      let status ← Runner.checkExercise ex
      Runner.displayResult ex status
      match status with
      | .success =>
        let state := state.advance Config.exercises
        state.save
        if state.allDone Config.exercises then
          IO.println s!"\n{Config.finalMessage}"
          return 0
        IO.println s!"\nMoving to next exercise: {UI.bold state.currentExercise}"
        IO.sleep 500
        watchLoop state "" true
      | _ =>
        IO.println s!"\n{UI.dim "Edit the file and save to re-check."}"
        IO.println s!"{UI.dim "Run `lake exe leanlings hint` in another terminal for a hint."}"
        IO.sleep 500
        watchLoop state content false
    else
      IO.sleep 500
      watchLoop state lastContent false
  | none =>
    IO.println s!"Error: exercise '{state.currentExercise}' not found"
    return 1

def watchMode : IO UInt32 := do
  IO.println s!"{UI.bold "Leanlings"} — Watch Mode"
  IO.println "Watching for file changes... (Ctrl+C to quit)\n"
  let state ← AppState.load Config.exercises
  watchLoop state "" true

def showSolution : IO Unit := do
  let state ← AppState.load Config.exercises
  match Config.getExercise state.currentExercise with
  | some ex =>
    IO.println s!"\n{UI.yellow "Solution"} for {UI.bold ex.name}:\n"
    let content ← IO.FS.readFile ex.solutionPath
    IO.println content
  | none =>
    IO.println "Error: current exercise not found"

def main (args : List String) : IO UInt32 := do
  match args with
  | [] => showStatus; return 0
  | ["run"] => runCurrent
  | ["run", name] => runExercise name
  | ["watch"] => watchMode
  | ["verify"] => verifyAll
  | ["hint"] => showHint; return 0
  | ["solution"] => showSolution; return 0
  | ["list"] => listExercises; return 0
  | ["next"] => nextExercise; return 0
  | ["reset"] =>
    let state ← AppState.load Config.exercises
    resetExercise state.currentExercise
  | ["reset", name] => resetExercise name
  | ["help"] | ["-h"] | ["--help"] => showHelp; return 0
  | _ =>
    IO.println s!"{UI.red "Error"}: Unknown command"
    IO.println ""
    showHelp
    return 1
