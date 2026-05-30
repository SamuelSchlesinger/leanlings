/- # Quiz 2: Practical Lean

  This quiz covers do notation, loops, and polymorphic
  functions. No new concepts — just applying what you know!

  TODO: Complete all definitions.
-/

-- Helper: safe division (returns none when dividing by zero)
def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

-- 1. Use do notation to chain two safe divisions:
--    divide a by b, then divide the result by c.
def safeDivTwice (a b c : Nat) : Option Nat := do
  sorry

-- 2. Use Id.run do with a mutable variable and for loop.
--    Compute 1² + 2² + ... + n²
def sumOfSquares (n : Nat) : Nat := Id.run do
  sorry

-- 3. Polymorphic function: count how many times `target`
--    appears in the list. Needs [BEq α] constraint.
def countOccurrences [BEq α] (target : α) (l : List α) : Nat :=
  sorry

-- Don't change below this line!
#guard safeDivTwice 100 5 4 == some 5
#guard safeDivTwice 100 0 4 == none
#guard safeDivTwice 100 5 0 == none
#guard sumOfSquares 0 == 0
#guard sumOfSquares 1 == 1
#guard sumOfSquares 3 == 14
#guard countOccurrences 3 [1, 3, 2, 3, 3] == 3
#guard countOccurrences "a" ["b", "a", "c"] == 1
#guard countOccurrences 7 ([] : List Nat) == 0
