/- # Nat Proofs 1: Addition Properties

  Let's prove fundamental properties of natural numbers.
  These are great practice combining tactics.

  Useful tactics:
  - `omega` -- linear arithmetic
  - `simp` -- simplification
  - `rw [lemma]` -- rewriting

  Useful lemmas (in the standard library):
  - `Nat.add_comm` : n + m = m + n
  - `Nat.add_assoc` : (a + b) + c = a + (b + c)
  - `Nat.zero_add` : 0 + n = n
  - `Nat.add_zero` : n + 0 = n

  TODO: Prove these properties.
-/

-- Addition is commutative
theorem my_add_comm (a b : Nat) : a + b = b + a := by
  sorry

-- Addition is associative
theorem my_add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) := by
  sorry

-- Zero is the identity for addition (both sides)
theorem add_zero_both (n : Nat) : 0 + n = n ∧ n + 0 = n := by
  sorry
