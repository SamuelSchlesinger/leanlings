/- # Control Flow 1: If / Then / Else

  `if/then/else` is an expression in Lean — it returns a value.

    if condition then value1 else value2

  Both branches must return the same type.

  For integers, you can compare with `<`, `>`, `<=`, `>=`, `==`.

  `Int` is the type of integers (..., -2, -1, 0, 1, 2, ...),
  unlike `Nat` which only includes non-negative numbers.
  You can negate an Int with `-n`.

  TODO: Implement `abs` that returns the absolute value of an integer.
-/

def abs (n : Int) : Int := sorry

-- Don't change below this line!
#guard abs 5 == 5
#guard abs (-3) == 3
#guard abs 0 == 0
