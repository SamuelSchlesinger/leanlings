/- # Recursion 1: Natural Number Recursion

  Lean supports recursive functions. For Nat recursion,
  match on zero and successor:

    def countdown : Nat → List Nat
      | 0     => [0]
      | n + 1 => (n + 1) :: countdown n

  `x :: xs` builds a list with first element `x` and remaining elements
  `xs`. In the example, the recursive call uses `n`, the predecessor
  of `n + 1`. This is structural recursion, so Lean can see it terminates.

  TODO: Implement `factorial`: multiply all numbers from 1 through n.
        The empty product, factorial 0, is 1.
        For n + 1, multiply n + 1 by factorial n.
        For example, factorial 5 = 5 * 4 * 3 * 2 * 1 = 120.
-/

def factorial : Nat → Nat := sorry
