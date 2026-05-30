/- # Functions 1: Simple Functions

  Functions take parameters and return a result.
  The body is an expression that can use the parameters.

    def double (n : Nat) : Nat := n + n

  TODO: Implement `triple` so it returns three times its input.
-/

def triple (n : Nat) : Nat := sorry

-- Don't change below this line!
#guard triple 0 == 0
#guard triple 4 == 12
