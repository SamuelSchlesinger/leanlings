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

/-- All exercises with a given bare name. -/
def exercisesNamed (c : Course) (name : String) : Array Exercise :=
  c.exercises.filter (·.name == name)

/-- Whether a bare exercise name needs qualification in this course. -/
def isAmbiguousName (c : Course) (name : String) : Bool :=
  (c.exercisesNamed name).size > 1

/-- Find an exercise by its qualified `dir/name` id, or by a bare name when that
name is unique in the course. Ambiguous bare names deliberately fail instead of
silently selecting the first exercise. -/
def getExercise (c : Course) (target : String) : Option Exercise :=
  match c.exercises.find? (·.id == target) with
  | some exercise => some exercise
  | none =>
    let candidates := c.exercisesNamed target
    if candidates.size == 1 then candidates[0]? else none

/-- The shortest label that still identifies this exercise in its course. -/
def displayName (c : Course) (exercise : Exercise) : String :=
  if c.isAmbiguousName exercise.name then exercise.id else exercise.name

end Course
end Leanlings
