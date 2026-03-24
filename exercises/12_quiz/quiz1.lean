/- # Quiz: Putting It All Together

  This exercise combines concepts from across the curriculum.
  There are no new concepts — just practice applying what
  you've learned!

  TODO: Complete all definitions and proofs below.
-/

-- 1. Define a structure
structure Point where
  x : Nat
  y : Nat
  deriving Repr, BEq

-- 2. Write a function using the structure
-- Manhattan distance: |p.x - q.x| + |p.y - q.y|
-- (use `if` to handle the subtraction safely on Nat)
def manhattan (p q : Point) : Nat := sorry

-- 3. Write a recursive function
-- Count elements in a list that satisfy a predicate
def countIf (pred : α → Bool) : List α → Nat := sorry

-- 4. Prove a property
-- Manhattan distance from a point to itself is 0
theorem manhattan_self (p : Point) : manhattan p p = 0 := by
  sorry

-- Don't change below this line!
#guard manhattan ⟨0, 0⟩ ⟨3, 4⟩ == 7
#guard manhattan ⟨5, 5⟩ ⟨5, 5⟩ == 0
#guard countIf (· > 3) [1, 5, 2, 7] == 2
#guard countIf (· == 0) [0, 1, 0, 0] == 3
