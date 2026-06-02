/- # Do Notation 3: Mutable Variables and For Loops

  In a `do` block, you can use mutable variables and for loops:

    def sumList (l : List Nat) : Nat := Id.run do
      let mut total := 0
      for x in l do
        total := total + x
      return total

  `Id.run` runs a pure `do` block (no IO needed).
  `let mut` creates a mutable variable.

  TODO: Implement these using mutable variables and for loops.
-/

-- Count how many elements satisfy a predicate
def countWhere (p : Nat → Bool) (l : List Nat) : Nat := Id.run do
  sorry

-- Find the maximum element (return 0 for empty list)
def listMax (l : List Nat) : Nat := Id.run do
  sorry
