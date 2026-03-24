def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

def chainedDivide : Option Nat := do
  let x ← safeDivide 100 5
  let y ← safeDivide x 4
  return y

def failingDivide : Option Nat := do
  let x ← safeDivide 100 0
  let y ← safeDivide x 4
  return y
