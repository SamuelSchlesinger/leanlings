/- # Definitions 1: Exploring with #check and #eval

  Two essential commands for learning Lean interactively:

  • `#eval expr`  — evaluates an expression and prints the result
  • `#check expr` — shows the type of an expression

  Try them! Add `#eval 2 + 3` anywhere in this file
  and your editor will show the result (5).
  Add `#check "hello"` and it will show `"hello" : String`.

  These are your best tools for experimenting with Lean.

  TODO: Use `#eval` in your editor to discover the answers,
        then fill them in.
-/

-- Hint: try `#eval 2 ^ 10` in your editor
def powerOfTwo : Nat := sorry

-- Hint: try `#eval "hello".length`
def helloLength : Nat := sorry

-- Hint: try `#eval (List.range 5).length`
-- List.range 5 produces [0, 1, 2, 3, 4]
def rangeLength : Nat := sorry

-- Don't change below this line!
#guard powerOfTwo == 1024
#guard helloLength == 5
#guard rangeLength == 5
