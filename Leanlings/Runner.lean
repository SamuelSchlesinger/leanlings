import Leanlings.Exercise
import Leanlings.UI

namespace Leanlings.Runner

private def containsSubstr (s sub : String) : Bool :=
  (s.splitOn sub).length > 1

/-- Check a single exercise by running `lean` on it -/
def checkExercise (exercise : Exercise) : IO ExerciseStatus := do
  let output ← IO.Process.output {
    cmd := "lean"
    args := #[exercise.path.toString]
  }
  if output.exitCode != 0 then
    return .compileError output.stderr
  if containsSubstr output.stderr "declaration uses `sorry`" ||
     containsSubstr output.stdout "declaration uses `sorry`" then
    return .hasSorry
  return .success

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
