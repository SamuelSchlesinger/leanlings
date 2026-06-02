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
  deriving Repr, BEq, Inhabited

namespace Exercise

def path (e : Exercise) : System.FilePath :=
  s!"courses/{e.course}/exercises/{e.dir}/{e.name}.lean"

def solutionPath (e : Exercise) : System.FilePath :=
  s!"courses/{e.course}/solutions/{e.dir}/{e.name}.lean"

/-- Hidden correctness checks (`#guard`s) for an exercise, kept out of the file
the learner edits so the expected answers aren't given away. May not exist. -/
def testPath (e : Exercise) : System.FilePath :=
  s!"courses/{e.course}/tests/{e.dir}/{e.name}.lean"

end Exercise
end Leanlings
