import Leanlings.Exercise

namespace Leanlings

/-- A single course: a named, ordered collection of exercises that lives under
`courses/<id>/`. Multiple courses can coexist; the active one is tracked in
`AppState`. -/
structure Course where
  /-- Slug used both as the `courses/<id>/` directory name and the CLI selector. -/
  id : String
  /-- Human-readable title shown in listings. -/
  title : String
  /-- One-line summary shown in `courses`. -/
  description : String
  exercises : Array Exercise
  /-- Shown when starting a course (progress at 0). -/
  welcome : String := ""
  /-- Shown when every exercise in the course is complete. -/
  final : String := ""
  deriving Inhabited

/-- Build a course, stamping its `id` onto every exercise so each exercise can
resolve its own file path without the caller threading the course through. -/
def mkCourse (id title description : String) (exercises : Array Exercise)
    (welcome : String := "") (final : String := "") : Course :=
  { id, title, description,
    exercises := exercises.map (fun e => { e with course := id }),
    welcome, final }

namespace Course

/-- Find an exercise within this course by name. -/
def getExercise (c : Course) (name : String) : Option Exercise :=
  c.exercises.find? (·.name == name)

end Course
end Leanlings
