import Leanlings.Exercise
import Leanlings.UI

namespace Leanlings.Runner

private def containsSubstr (s sub : String) : Bool :=
  (s.splitOn sub).length > 1

/-- Run `lean` on a file via `lake env lean` (so course-library imports resolve)
and classify the result. -/
private def runLean (path : System.FilePath) : IO ExerciseStatus := do
  let output ← IO.Process.output { cmd := "lake", args := #["env", "lean", path.toString] }
  -- Check for sorry first — if sorry is present, that's the primary issue
  -- (test failures caused by sorry are noise the user doesn't need to see).
  if containsSubstr output.stderr "declaration uses `sorry`" ||
     containsSubstr output.stdout "declaration uses `sorry`" then
    return .hasSorry
  if output.exitCode != 0 then
    -- Lean writes its diagnostics to stdout; include stderr too just in case.
    return .compileError (output.stdout ++ output.stderr)
  return .success

private def normalizeNewlines (s : String) : String :=
  s.replace "\r\n" "\n"

/-- Execute an IO exercise and compare its stdout with the contract in its
metadata. This catches programs that merely type-check without doing the task. -/
private def checkProgramOutput (exercise : Exercise) (expected : String) :
    IO ExerciseStatus := do
  let output ← IO.Process.output {
    cmd := "lake"
    args := #["env", "lean", "--run", exercise.path.toString]
  }
  if output.exitCode != 0 then
    return .compileError
      ("Your code compiles, but running it failed:\n" ++ output.stdout ++ output.stderr)
  let actual := normalizeNewlines output.stdout
  let expected := normalizeNewlines expected
  if actual == expected then
    return .success
  return .compileError
    ("Your code compiles, but it prints the wrong output.\n" ++
     s!"Expected: {reprStr expected}\n" ++
     s!"Actual:   {reprStr actual}")

/-- Check a single exercise.

Compiles via `lake env lean` so exercises that `import` a course library (e.g.
the `nng` course's `MyNat` development) resolve against the built package; the
`intro` course imports nothing and is unaffected. Requires `lake build` first.

Correctness checks (`#guard`s) are kept in a hidden test file so the expected
answers aren't shown to the learner. We check in two phases:

1. Compile the exercise alone, so `sorry`/type errors are reported against the
   real file with correct line numbers.
2. If that is clean and a hidden test file exists, compile the exercise and the
   tests together. A failure here means the code type-checks but doesn't meet
   the requirement; we say so without revealing the checks.
3. If the exercise declares expected output, execute it and compare stdout
   exactly (apart from normalizing platform newline sequences). -/
def checkExercise (exercise : Exercise) : IO ExerciseStatus := do
  match ← runLean exercise.path with
  | .success =>
    let testSrc ← (try some <$> IO.FS.readFile exercise.testPath catch _ => pure none)
    match testSrc with
    | none => pure ()
    | some tests =>
      let exSrc ← IO.FS.readFile exercise.path
      let tmp : System.FilePath := ".leanlings-check.lean"
      IO.FS.writeFile tmp (exSrc ++ "\n\n" ++ tests)
      let result ← runLean tmp
      try IO.FS.removeFile tmp catch _ => pure ()
      match result with
      | .success => pure ()
      | _ =>
        return .compileError
          "Your code compiles, but it doesn't satisfy the exercise's checks yet.\n\
           Re-read the task — the expected behaviour is described there."
    match exercise.expectedOutput with
    | some expected => checkProgramOutput exercise expected
    | none => return .success
  | other => return other

/-- Display the result of checking an exercise -/
def displayResult (exercise : Exercise) (status : ExerciseStatus) : IO Unit := do
  match status with
  | .success =>
    IO.println s!"{UI.green "✓"} Exercise {UI.bold exercise.name} compiled successfully!"
  | .compileError output =>
    IO.println s!"{UI.red "✗"} Exercise {UI.bold exercise.name} has errors:\n"
    IO.println output
    IO.println s!"\n{UI.dim "Read the error above and fix the issue in the exercise file."}"
    IO.println s!"{UI.dim "Run `lake exe leanlings hint` for a hint."}"
  | .hasSorry =>
    IO.println s!"{UI.yellow "!"} Exercise {UI.bold exercise.name} compiles but still has {UI.cyan "sorry"}."
    IO.println s!"  Replace each {UI.cyan "sorry"} with your solution."

end Leanlings.Runner
