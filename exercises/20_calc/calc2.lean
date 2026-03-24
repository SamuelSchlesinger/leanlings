/- # Calc 2: Inequalities in Calc

  `calc` also works with `≤`, `<`, `≥`, `>` and mixtures:

    calc a
        _ ≤ b := by ...
        _ < c := by ...   -- the relations compose: a < c

  Lean automatically combines compatible relations.

  TODO: Complete these calculational proofs.
-/

-- Chain of inequalities
theorem calc_ineq (a b c : Nat) (h1 : a ≤ b) (h2 : b ≤ c) : a ≤ c := by
  sorry

-- Mixed equality and inequality
theorem calc_mixed (a b : Nat) (h : a ≤ b) : a ≤ b + 1 := by
  sorry

-- Strict inequality
theorem calc_strict (n : Nat) : n < n + 2 := by
  sorry
