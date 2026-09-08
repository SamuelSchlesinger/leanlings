import Lean
import Leanlings.Config

/-! Versioned, renderer-independent curriculum export. The consumer decides
how to present lessons, hints and solutions and how to provide a Lean runtime.
Checks are separate from editable source, not secrets: a browser must receive
them to run them. No account or filesystem state is exported. -/

open Lean Leanlings

private def readOptional (path : System.FilePath) : IO String := do
  if ← path.pathExists then IO.FS.readFile path else pure ""

def main : IO Unit := do
  let courses ← Config.courses.mapM fun course => do
    let mut unitIds : Array String := #[]
    for exercise in course.exercises do
      unless unitIds.contains exercise.dir do
        unitIds := unitIds.push exercise.dir
    let units ← unitIds.mapM fun id => do
      return Json.mkObj [
        ("id", toJson id),
        ("guide", toJson (← readOptional s!"courses/{course.id}/units/{id}.md"))]
    let exercises ← course.exercises.mapM fun exercise => do
      return Json.mkObj [
        ("id", toJson exercise.id), ("unit", toJson exercise.dir),
        ("name", toJson exercise.name), ("kind", toJson "lean"),
        ("hint", toJson exercise.hint),
        ("source", toJson (← IO.FS.readFile exercise.path)),
        ("solution", toJson (← IO.FS.readFile exercise.solutionPath)),
        ("checks", toJson (← readOptional exercise.testPath)),
        ("contracts", toJson (← readOptional exercise.contractPath)),
        ("expectedOutput", toJson exercise.expectedOutput)]
    return Json.mkObj [
      ("id", toJson course.id), ("title", toJson course.title),
      ("description", toJson course.description), ("welcome", toJson course.welcome),
      ("guide", toJson (← readOptional course.guidePath)),
      ("units", toJson units),
      ("conclusion", toJson course.final), ("exercises", toJson exercises)]
  IO.println <| (Json.mkObj [
    ("schemaVersion", toJson (1 : Nat)), ("provider", toJson "leanlings"),
    ("leanToolchain", toJson (← IO.FS.readFile "lean-toolchain").trimAscii.toString),
    ("courses", toJson courses)]).compress
