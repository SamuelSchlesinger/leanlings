/- # Do Notation 1: Chaining with Option

  You might associate `do` with IO, but it works with any
  monad — including `Option`! We cover `do` before IO to
  show that the notation is about *sequencing*, not side effects.

  `do` notation lets you chain operations that might fail.
  With `Option`:

    def safeDivide (a b : Nat) : Option Nat :=
      if b == 0 then none else some (a / b)

    def divideAndAdd : Option Nat := do
      let x ← safeDivide 10 2    -- x = 5, or short-circuit to none
      let y ← safeDivide x 1     -- y = 5
      return x + y                -- some 10

  `←` extracts the value from `some`. If any step returns `none`,
  the entire `do` block returns `none`.

  Compare `let x := safeDivide 10 2` with `let x ← safeDivide 10 2`.
  With `:=`, `x` has type `Option Nat`; with `←`, later lines receive
  `x : Nat` only in the successful case. `return x` wraps the result
  in `some`. You can type the arrow as `<-`.

  TODO: Fill in the do blocks below.
-/

def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

-- Compute 100 / 5 / 4 using do notation (should be some 5)
def chainedDivide : Option Nat := do
  sorry

-- This should return none (division by zero in the chain)
def failingDivide : Option Nat := do
  sorry
