/- # Do Notation 1: Chaining with Option

  `do` notation lets you chain operations that might fail.
  With `Option`:

    def safeDivide (a b : Nat) : Option Nat :=
      if b == 0 then none else some (a / b)

    def example : Option Nat := do
      let x ← safeDivide 10 2    -- x = 5, or short-circuit to none
      let y ← safeDivide x 1     -- y = 5
      return x + y                -- some 10

  `←` extracts the value from `some`. If any step returns `none`,
  the entire `do` block returns `none`.

  TODO: Implement chainedDivide using do notation.
-/

def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

-- Compute 100 / 5 / 4 using do notation (should be some 5)
def chainedDivide : Option Nat := sorry

-- This should return none (division by zero in the chain)
def failingDivide : Option Nat := sorry
