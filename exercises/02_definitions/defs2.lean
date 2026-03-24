/- # Definitions 2: Function Definitions

  Functions are also defined with `def`, listing parameters
  in parentheses:

    def functionName (param : ParamType) : ReturnType := body

  For example:
    def increment (n : Nat) : Nat := n + 1

  TODO: Define `square` that returns the square of a number.
-/

def square (n : Nat) : Nat := sorry

-- Don't change below this line!
#guard square 0 == 0
#guard square 5 == 25
#guard square 3 == 9
