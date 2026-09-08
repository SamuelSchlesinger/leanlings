/- # Arrays 1: Array Basics

  `Array α` is Lean's efficient random-access collection:

    let a := #[1, 2, 3]          -- array literal
    a.size                         -- 3
    a[0]!                          -- 1; panics if the index is out of bounds
    a[0]?                          -- some 1; returns none out of bounds
    a.push 4                       -- #[1, 2, 3, 4]
    a.map (· * 2)                  -- #[2, 4, 6]

  Arrays give constant-time indexed access; reaching the nth list
  element takes a traversal. Lists remain convenient for structural
  recursion. Choose according to the operations your program needs.
  `push` returns an updated array value; it does not change the meaning
  of an earlier binding. Bounds-checked `a[i]!` needs an in-range index;
  use `a[i]?` when absence is a normal outcome.

  TODO: Implement these array operations.
-/

-- Double every element in the array
def doubleArray (a : Array Nat) : Array Nat := sorry

-- Sum all elements of an array using a fold
def arraySum (a : Array Nat) : Nat := sorry

-- Keep only elements greater than a threshold
def filterAbove (a : Array Nat) (threshold : Nat) : Array Nat := sorry
