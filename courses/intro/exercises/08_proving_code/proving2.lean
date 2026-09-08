/- # Proving Code 2: Tactic Proofs

  When a proof involves *variables* (not concrete values),
  you can't always rely on `rfl`. Instead, use tactic mode
  by writing `by`:

    theorem foo : ... := by
      tactic_here

  Useful tactics:
  • `rfl` — closes an equality when the sides are equal by definition
  • `unfold f` — replaces `f` with its definition, so you can keep working
  • `simp [f]` — unfolds function `f` and simplifies
  • `omega` — solves linear arithmetic over natural numbers and integers

  A variable alone does not prevent `rfl`: `triple n` unfolds to
  `3 * n`, so those expressions are equal by definition for any `n`.
  For `double_add`, unfolding instead leaves additions grouped in
  different ways; that is where arithmetic reasoning is needed.

  Inspect the goal after each tactic. `simp` may already finish it.
  Put a following `omega` on a new line only if a goal remains.

  TODO: Complete the proofs. Hints are in the comments.
-/

def double (n : Nat) : Nat := n + n

def triple (n : Nat) : Nat := 3 * n

-- Concrete values: `rfl` still works inside `by`
theorem triple_0 : triple 0 = 0 := by
  sorry

-- Variable n: unfold the definition with `simp [triple]`
theorem triple_def (n : Nat) : triple n = 3 * n := by
  sorry

-- Arithmetic with variables: try `omega`
theorem zero_add (n : Nat) : 0 + n = n := by
  sorry

-- Combine unfolding + arithmetic: `simp [double]; omega`
theorem double_add (a b : Nat) : double (a + b) = double a + double b := by
  sorry
