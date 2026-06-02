/- # Proving Code 3: Proving General Properties

  You've proved facts about specific values and about
  variables. Now let's prove properties that combine
  function definitions with arithmetic reasoning.

  Strategy:
  1. `simp [f]` to unfold your function's definition
  2. `omega` to handle the resulting arithmetic

  After this module, you'll prove things about abstract
  propositions — but the tactics are the same ones
  you've just learned!

  TODO: Complete the proofs.
-/

def double (n : Nat) : Nat := n + n

-- double n is the same as 2 * n
theorem double_is_mul2 (n : Nat) : double n = 2 * n := by
  sorry

-- double preserves the ≤ ordering
theorem double_le (a b : Nat) (h : a ≤ b) : double a ≤ double b := by
  sorry

-- Composing double with itself
theorem double_double (n : Nat) : double (double n) = 4 * n := by
  sorry
