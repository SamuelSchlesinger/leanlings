/- # Control Flow 3: Pattern Matching

  `match` lets you branch based on the structure of a value.

  `Option α` represents a value that might be absent:
  • `some x` — contains a value `x`
  • `none`   — no value

  Pattern matching syntax:
    match value with
    | pattern1 => result1
    | pattern2 => result2

  TODO: Implement `getOrDefault` that extracts the value from
        an Option, or returns a default if none.
-/

def getOrDefault (opt : Option Nat) (default : Nat) : Nat :=
  sorry

-- Don't change below this line!
#guard getOrDefault (some 42) 0 == 42
#guard getOrDefault none 99 == 99
