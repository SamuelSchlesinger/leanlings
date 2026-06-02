def safeDivide (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

def safeDivTwice (a b c : Nat) : Option Nat := do
  let x ← safeDivide a b
  safeDivide x c

def sumOfSquares (n : Nat) : Nat := Id.run do
  let mut total := 0
  for i in List.range n do
    let k := i + 1
    total := total + k * k
  return total

def countOccurrences [BEq α] (target : α) (l : List α) : Nat :=
  match l with
  | [] => 0
  | h :: t => (if h == target then 1 else 0) + countOccurrences target t
