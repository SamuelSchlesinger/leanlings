/- # Functions 2: Multiple Parameters

  Functions can take multiple parameters, each in their own
  parenthesized group:

    def add (a : Nat) (b : Nat) : Nat := a + b

  You can also group parameters of the same type:

    def add (a b : Nat) : Nat := a + b

  TODO: Implement `average` that returns the average of two
        natural numbers (integer division is fine).
-/

def average (a b : Nat) : Nat := sorry
