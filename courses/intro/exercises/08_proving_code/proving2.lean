/- # Proving Code 2: Tactic Proofs

  When a proof involves *variables* (not concrete values),
  you can't always rely on `rfl`. Instead, use tactic mode
  by writing `by`:

    theorem foo : ... := by
      tactic_here

  Useful tactics:
  • `rfl` — closes the goal when both sides are equal
  • `simp [f]` — unfolds function `f` and simplifies
  • `omega` — solves arithmetic about natural numbers

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
