/- # Functions 2: Multiple Parameters

  Functions can take multiple parameters, each in their own
  parenthesized group:

    def add (a : Nat) (b : Nat) : Nat := a + b

  You can also group parameters of the same type:

    def add (a b : Nat) : Nat := a + b

  On `Nat`, division rounds down: `5 / 2` is 2.

  TODO: Implement `average` as the sum of its inputs divided by two,
        rounded down. For example, `average 2 3` should be 2.
-/

def average (a b : Nat) : Nat := sorry
