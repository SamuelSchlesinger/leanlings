import Leanlings

open Leanlings

/-- Load progress state together with the active course, repairing a stale or
missing course selection to the default. Every command starts here. -/
def loadActive : IO (AppState × Course) := do
  let state ← AppState.load Config.courses Config.defaultCourse
  let course := (Config.getCourse state.currentCourse).getD Config.defaultCourse
  return (state, course)

def showHelp : IO Unit := do
  IO.println "Usage: lake exe leanlings [command]\n"
  IO.println "Commands:"
  IO.println "  (none)       Show current exercise and status"
  IO.println "  run          Check the current exercise"
  IO.println "  run <name>   Check a specific exercise (use dir/name if ambiguous)"
  IO.println "  watch        Watch mode, auto-checks on save"
  IO.println "  verify       Check all exercises in the current course"
  IO.println "  guide        Read the course overview and current unit's notes"
  IO.println "  guide <name> Read the overview and notes for a specific exercise"
  IO.println "  hint         Show a hint for the current exercise"
  IO.println "  hint <name>  Show a hint for a specific exercise"
  IO.println "  solution     Show the solution for the current exercise"
  IO.println "  solution <name> Show the solution for a specific exercise"
  IO.println "  list         List exercises in the current course with status"
  IO.println "  next         Move to the next exercise"
  IO.println "  reset        Reset the current exercise (requires git)"
  IO.println "  reset <name> Reset a specific exercise"
  IO.println "  courses      List available courses"
  IO.println "  course <id>  Switch to another course"
  IO.println "  help         Show this help"
  IO.println "\nIf a name is repeated, qualify it as dir/name (for example, Rat/add_comm)."

/-- Explain a failed exercise lookup, including every qualified choice when a
bare name occurs more than once in the active course. -/
def showExerciseLookupError (course : Course) (target : String) : IO Unit := do
  let candidates := course.exercisesNamed target
  if candidates.size > 1 then
    IO.println s!"{UI.red "Error"}: exercise name '{target}' is ambiguous in course '{course.id}'."
    IO.println "Use one of these qualified names:"
    for exercise in candidates do
      IO.println s!"  {exercise.id}"
  else
    IO.println s!"{UI.red "Error"}: exercise '{target}' not found in course '{course.id}'"

/-- Put the teaching material beside the file learners are asked to edit. -/
def showLearningResources (course : Course) (ex : Exercise) : IO Unit := do
  IO.println s!"Unit: {ex.dir}"
  if ← course.guidePath.pathExists then
    IO.println s!"Course guide: {course.guidePath}"
  if ← ex.unitGuidePath.pathExists then
    IO.println s!"Unit notes: {ex.unitGuidePath}"
  IO.println s!"Read with: lake exe leanlings guide {ex.id}"

/-- Reading a guide never moves the learner or reveals an exercise solution. -/
def showGuide (target : Option String) : IO UInt32 := do
  let (state, course) ← loadActive
  let name := target.getD state.currentExercise
  match course.getExercise name with
  | none =>
    showExerciseLookupError course name
    return 1
  | some ex =>
    IO.println s!"\n{UI.bold course.title} — {ex.dir}\n"
    if ← course.guidePath.pathExists then
      IO.println (← IO.FS.readFile course.guidePath)
    if ← ex.unitGuidePath.pathExists then
      IO.println (← IO.FS.readFile ex.unitGuidePath)
    else
      IO.println "This unit's lesson is in the opening comments of each exercise file."
    IO.println s!"Exercise: {ex.path}"
    return 0

def showStatus : IO Unit := do
  let (state, course) ← loadActive
  let done := state.countDone course
  let total := course.exercises.size
  IO.println s!"\n{UI.bold "Leanlings"} — Learn Lean 4 one exercise at a time\n"
  IO.println s!"{UI.dim "Course"}: {UI.bold course.title}"
  IO.println (UI.progressBar done total)
  IO.println ""
  if done == 0 then
    IO.println course.welcome
  if state.allDone course then
    IO.println course.final
  else
    match course.getExercise state.currentExercise with
    | some ex =>
      IO.println s!"Current exercise: {UI.bold (course.displayName ex)}"
      IO.println s!"  → {ex.path}"
      showLearningResources course ex
      IO.println ""
      IO.println "Open this file in your editor and follow the instructions!"
      IO.println "Then run: lake exe leanlings run"
    | none =>
      IO.println s!"Error: exercise '{state.currentExercise}' not found"

def runExercise (name : String) : IO UInt32 := do
  let (state, course) ← loadActive
  match course.getExercise name with
  | some ex =>
    IO.println s!"Checking {UI.bold (course.displayName ex)}...\n"
    let status ← Runner.checkExercise ex
    Runner.displayResult ex status
    match status with
    | .success =>
      let state := state.markCompleted course.id ex.id
      state.save
      IO.println s!"\n{UI.progressBar (state.countDone course) course.exercises.size}"
      if state.allDone course then
        IO.println s!"\n{course.final}"
      else
        IO.println "\nRun `lake exe leanlings next` to continue."
      return 0
    | _ =>
      (state.markIncomplete course.id ex.id).save
      return 1
  | none =>
    showExerciseLookupError course name
    return 1

def runCurrent : IO UInt32 := do
  let (state, _) ← loadActive
  runExercise state.currentExercise

def showHint (target : Option String) : IO Unit := do
  let (state, course) ← loadActive
  let name := target.getD state.currentExercise
  match course.getExercise name with
  | some ex =>
    IO.println s!"\n{UI.cyan "Hint"} for {UI.bold (course.displayName ex)}:\n"
    IO.println ex.hint
  | none =>
    showExerciseLookupError course name

def listExercises : IO Unit := do
  let (state, course) ← loadActive
  IO.println s!"\n{UI.bold "Exercises"} — {course.title}:\n"
  let mut lastUnit := ""
  for ex in course.exercises do
    if ex.dir != lastUnit then
      IO.println s!"\n{UI.cyan ex.dir}"
      lastUnit := ex.dir
    let marker := if state.isCompleted course.id ex.id then UI.green "✓"
                  else if state.currentExercise == ex.id then UI.yellow "→"
                  else "  "
    IO.println s!" {marker} {course.displayName ex}"
  IO.println ""
  IO.println (UI.progressBar (state.countDone course) course.exercises.size)

def nextExercise : IO Unit := do
  let (state, course) ← loadActive
  let idx := course.exercises.findIdx? (·.id == state.currentExercise)
  match idx with
  | some i =>
    if i + 1 < course.exercises.size then
      if !state.isCompleted course.id state.currentExercise then
        let currentLabel := (course.getExercise state.currentExercise).map
          (course.displayName ·) |>.getD state.currentExercise
        IO.println s!"{UI.yellow "!"} Warning: current exercise '{currentLabel}' is not yet completed."
        IO.println "  Skipping to next exercise anyway."
      let next := course.exercises[i + 1]!
      let state := { state with currentExercise := next.id }
      state.save
      IO.println s!"Current exercise: {UI.bold (course.displayName next)}"
      IO.println s!"  → {next.path}"
      showLearningResources course next
    else
      IO.println "You're already on the last exercise!"
  | none =>
    IO.println "Error: could not find current exercise"

def resetExercise (name : String) : IO UInt32 := do
  let (state, course) ← loadActive
  match course.getExercise name with
  | some ex =>
    let result ← IO.Process.output {
      cmd := "git"
      args := #["checkout", "--", ex.path.toString]
    }
    if result.exitCode == 0 then
      -- The file is back to `sorry`, so it's no longer solved: clear its
      -- completion and make it the current exercise again.
      let state := state.markIncomplete course.id ex.id
      let state := { state with currentExercise := ex.id }
      state.save
      IO.println s!"{UI.green "✓"} Reset {course.displayName ex} to original state"
      return 0
    else
      IO.println s!"{UI.red "Error"}: Could not reset. Make sure you're in a git repository."
      IO.println s!"  You can manually look at {ex.solutionPath}"
      return 1
  | none =>
    showExerciseLookupError course name
    return 1

def verifyAll : IO UInt32 := do
  let (state, course) ← loadActive
  IO.println s!"\n{UI.bold "Verifying all exercises"} — {course.title}...\n"
  -- Recompute this course's completion from scratch, preserving other courses.
  let others := state.completed.filter (fun k => !k.startsWith s!"{course.id}/")
  let mut state := { state with completed := others }
  let mut doneCount : Nat := 0
  for ex in course.exercises do
    let status ← Runner.checkExercise ex
    match status with
    | .success =>
      IO.println s!"  {UI.green "✓"} {course.displayName ex}"
      doneCount := doneCount + 1
      state := state.markCompleted course.id ex.id
    | .compileError _ =>
      IO.println s!"  {UI.red "✗"} {course.displayName ex}"
    | .hasSorry =>
      IO.println s!"  {UI.yellow "!"} {course.displayName ex}"
  state.save
  IO.println s!"\n{UI.progressBar doneCount course.exercises.size}"
  if doneCount == course.exercises.size then
    IO.println s!"\n{course.final}"
    return 0
  else
    IO.println s!"\n{doneCount}/{course.exercises.size} exercises completed."
    return 1

partial def watchLoop (course : Course) (state : AppState) (lastContent : String) (firstRun : Bool) : IO UInt32 := do
  if state.allDone course then
    IO.print UI.clearScreen
    IO.println course.final
    return 0
  match course.getExercise state.currentExercise with
  | some ex =>
    let content ← try
      IO.FS.readFile ex.path
    catch _ =>
      -- File may be mid-write; retry on next poll
      IO.sleep 500
      return ← watchLoop course state lastContent false
    if content != lastContent || firstRun then
      IO.print UI.clearScreen
      IO.println s!"{UI.bold "Leanlings"} — Watch Mode ({course.title})\n"
      IO.println s!"{UI.progressBar (state.countDone course) course.exercises.size}\n"
      IO.println s!"Exercise: {ex.path}"
      showLearningResources course ex
      IO.println ""
      IO.println s!"Checking {UI.bold (course.displayName ex)}...\n"
      let status ← Runner.checkExercise ex
      Runner.displayResult ex status
      match status with
      | .success =>
        let state := state.advance course
        state.save
        if state.allDone course then
          IO.println s!"\n{course.final}"
          return 0
        let nextLabel := (course.getExercise state.currentExercise).map
          (course.displayName ·) |>.getD state.currentExercise
        IO.println s!"\nMoving to next exercise: {UI.bold nextLabel}"
        IO.sleep 500
        watchLoop course state "" true
      | _ =>
        IO.println s!"\n{UI.dim "Edit the file and save to re-check."}"
        IO.println s!"{UI.dim "Run `lake exe leanlings hint` in another terminal for a hint."}"
        IO.sleep 500
        watchLoop course state content false
    else
      IO.sleep 500
      watchLoop course state lastContent false
  | none =>
    IO.println s!"Error: exercise '{state.currentExercise}' not found"
    return 1

def watchMode : IO UInt32 := do
  IO.println s!"{UI.bold "Leanlings"} — Watch Mode"
  IO.println "Watching for file changes... (Ctrl+C to quit)\n"
  let (state, course) ← loadActive
  watchLoop course state "" true

def showSolution (target : Option String) : IO Unit := do
  let (state, course) ← loadActive
  let name := target.getD state.currentExercise
  match course.getExercise name with
  | some ex =>
    IO.println s!"\n{UI.yellow "Solution"} for {UI.bold (course.displayName ex)}:\n"
    let content ← IO.FS.readFile ex.solutionPath
    IO.println content
  | none =>
    showExerciseLookupError course name

def listCourses : IO Unit := do
  let (state, _) ← loadActive
  IO.println s!"\n{UI.bold "Courses"}:\n"
  for c in Config.courses do
    let marker := if c.id == state.currentCourse then UI.yellow "→" else "  "
    let done := state.countDone c
    IO.println s!" {marker} {UI.bold c.id}  ({done}/{c.exercises.size})  {c.title}"
    IO.println s!"      {UI.dim c.description}"
  IO.println ""
  IO.println "Switch with: lake exe leanlings course <id>"

def selectCourse (id : String) : IO UInt32 := do
  match Config.getCourse id with
  | some course =>
    let state ← AppState.load Config.courses Config.defaultCourse
    let state := state.switchCourse course
    state.save
    IO.println s!"{UI.green "✓"} Switched to course {UI.bold course.title}"
    if state.countDone course == 0 then
      IO.println course.welcome
    match course.getExercise state.currentExercise with
    | some ex =>
      IO.println s!"Current exercise: {UI.bold (course.displayName ex)}"
      IO.println s!"  → {ex.path}"
      showLearningResources course ex
    | none =>
      IO.println s!"Current exercise: {UI.bold state.currentExercise}"
    return 0
  | none =>
    IO.println s!"{UI.red "Error"}: course '{id}' not found"
    IO.println "Run `lake exe leanlings courses` to see available courses."
    return 1

def main (args : List String) : IO UInt32 := do
  match args with
  | [] => showStatus; return 0
  | ["run"] => runCurrent
  | ["run", name] => runExercise name
  | ["watch"] => watchMode
  | ["verify"] => verifyAll
  | ["guide"] => showGuide none
  | ["guide", name] => showGuide (some name)
  | ["hint"] => showHint none; return 0
  | ["hint", name] => showHint (some name); return 0
  | ["solution"] => showSolution none; return 0
  | ["solution", name] => showSolution (some name); return 0
  | ["list"] => listExercises; return 0
  | ["next"] => nextExercise; return 0
  | ["reset"] =>
    let (state, _) ← loadActive
    resetExercise state.currentExercise
  | ["reset", name] => resetExercise name
  | ["courses"] => listCourses; return 0
  | ["course", id] => selectCourse id
  | ["help"] | ["-h"] | ["--help"] => showHelp; return 0
  | _ =>
    IO.println s!"{UI.red "Error"}: Unknown command"
    IO.println ""
    showHelp
    return 1
