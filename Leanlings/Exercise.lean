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
  hint : String := ""
  deriving Repr, BEq, Inhabited

namespace Exercise

def path (e : Exercise) : System.FilePath :=
  s!"exercises/{e.dir}/{e.name}.lean"

def solutionPath (e : Exercise) : System.FilePath :=
  s!"solutions/{e.dir}/{e.name}.lean"

end Exercise
end Leanlings
