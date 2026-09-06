namespace Leanlings

/-- The result of checking an exercise -/
inductive ExerciseStatus where
  | success
  | compileError (output : String)
  | hasSorry
  deriving Repr

/-- Metadata about a single exercise -/
structure Exercise where
  name : String := ""
  dir : String := ""
  /-- The id of the course this exercise belongs to. Stamped by `mkCourse`. -/
  course : String := ""
  hint : String := ""
  /-- Exact stdout expected when this exercise is executed with `lean --run`.
  Most exercises are compile-time tasks and leave this unset. -/
  expectedOutput : Option String := none
  deriving Repr, BEq, Inhabited

namespace Exercise

/-- The exercise's course-local, unambiguous identifier. Bare names remain
accepted by the CLI when they identify exactly one exercise in a course. -/
def id (e : Exercise) : String :=
  s!"{e.dir}/{e.name}"

def path (e : Exercise) : System.FilePath :=
  s!"courses/{e.course}/exercises/{e.dir}/{e.name}.lean"

def solutionPath (e : Exercise) : System.FilePath :=
  s!"courses/{e.course}/solutions/{e.dir}/{e.name}.lean"

/-- Behavioral checks (`#guard`s), separate from the learner's editable file.
They are distributed with the curriculum and are not secret. May not exist. -/
def testPath (e : Exercise) : System.FilePath :=
  s!"courses/{e.course}/tests/{e.dir}/{e.name}.lean"

/-- Generated checks requiring the reference's theorem statements to remain
present. Separate from behavioral tests so regeneration cannot erase them. -/
def contractPath (e : Exercise) : System.FilePath :=
  s!"courses/{e.course}/contracts/{e.dir}/{e.name}.lean"

end Exercise
end Leanlings
