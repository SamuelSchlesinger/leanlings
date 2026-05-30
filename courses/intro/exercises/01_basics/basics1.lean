/- # Basics 1: Natural Numbers

  `Nat` is Lean's type for natural numbers: 0, 1, 2, 3, ...
  You can use arithmetic operators: +, -, *, /, ^

  Try evaluating expressions in your editor with `#eval`:
    #eval 2 + 3     -- 5
    #eval 6 * 7     -- 42
    #eval 2 ^ 10    -- 1024

  TODO: Replace each `sorry` with an arithmetic expression
        that gives the right value.
-/

def product : Nat := sorry

def power : Nat := sorry

-- Don't change below this line!
#guard product == 42
#guard power == 1024
