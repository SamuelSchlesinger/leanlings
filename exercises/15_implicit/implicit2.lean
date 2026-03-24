/- # Implicit Arguments 2: Type Class Constraints

  Square brackets `[...]` pass type class instances:

    def printTwice [ToString α] (x : α) : String :=
      toString x ++ ", " ++ toString x

  This works with any type that has a `ToString` instance.
  Lean automatically finds the right instance.

  TODO: Implement these polymorphic functions using type class constraints.
-/

-- Check if a list contains an element (needs BEq)
def myContains [BEq α] (x : α) (l : List α) : Bool := sorry

-- Remove duplicates from a list (needs BEq)
def myDedup [BEq α] (l : List α) : List α := sorry
