import Leanlings.Exercise
import Leanlings.UI

namespace Leanlings.Runner

private def containsSubstr (s sub : String) : Bool :=
  (s.splitOn sub).length > 1

/-- Run `lean` on a file via `lake env lean` (so course-library imports resolve)
and classify the result. -/
private def runLean (path : System.FilePath) : IO ExerciseStatus := do
  let output ← IO.Process.output { cmd := "lake", args := #["env", "lean", path.toString] }
  -- Show real errors even when other holes remain. Otherwise a learner fixing
  -- a multi-part exercise cannot see a type error until every sorry is gone.
  if output.exitCode != 0 then
    return .compileError (output.stdout ++ output.stderr)
  if containsSubstr output.stderr "declaration uses `sorry`" ||
     containsSubstr output.stdout "declaration uses `sorry`" ||
     (output.stdout.splitOn "\n").any (fun line =>
       containsSubstr line "depends on axioms:" && containsSubstr line "sorryAx") then
    return .hasSorry
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

Behavioral checks (`#guard`s) and generated theorem-type contracts are kept
outside the file the learner edits. They are not secret tests; browser clients
need the same checks. We check in three phases:

1. Compile the exercise alone, so `sorry`/type errors are reported against the
   real file with correct line numbers.
2. If that is clean, compile the exercise together with its checks and theorem
   contracts. This also rejects deleting a theorem or changing its statement.
3. If the exercise declares expected output, execute it and compare stdout
   exactly (apart from normalizing platform newline sequences). -/
def checkExercise (exercise : Exercise) : IO ExerciseStatus := do
  match ← runLean exercise.path with
  | .success =>
    let mut tests := ""
    for path in [exercise.testPath, exercise.contractPath] do
      try
        if ← path.pathExists then
          tests := tests ++ "\n" ++ (← IO.FS.readFile path)
      catch e =>
        return .compileError s!"Could not read the exercise checks: {e}"
    if !tests.trimAscii.isEmpty then
      let exSrc ← IO.FS.readFile exercise.path
      let result ← IO.FS.withTempDir fun dir => do
        let tmp := dir / "Check.lean"
        IO.FS.writeFile tmp (exSrc ++ "\n\n" ++ tests)
        runLean tmp
      match result with
      | .success => pure ()
      | .hasSorry => return .hasSorry
      | _ =>
        return .compileError
          "Your code compiles, but it doesn't satisfy the exercise's checks yet.\n\
           Check the task's requirements and keep the supplied theorem statements."
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
