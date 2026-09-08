/- # Basics 1: Natural Numbers

  `Nat` is Lean's type for natural numbers: 0, 1, 2, 3, ...
  You can use arithmetic operators: +, -, *, /, ^

  These operations stay in `Nat`: subtraction stops at zero
  (`3 - 5 = 0`), and division rounds down (`5 / 2 = 2`).
  Later we will use `Int` when negative answers are needed.

  Try evaluating expressions in your editor with `#eval`:
    #eval 2 + 3     -- 5
    #eval 4 * 5     -- 20
    #eval 3 ^ 2     -- 9

  TODO: Replace each `sorry` below:
  • `product` should equal 42 — write it as a product of two numbers.
  • `power` should equal 1024 — write it using `^`.
-/

def product : Nat := sorry

def power : Nat := sorry
