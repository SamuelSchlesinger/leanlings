/- # Calc 2: Inequalities in Calc

  `calc` also works with `≤`, `<`, `≥`, `>` and mixtures:

    calc a
        _ ≤ b := by ...
        _ < c := by ...   -- the relations compose: a < c

  Lean automatically combines compatible relations.

  TODO: Complete these calculational proofs.
        Use `calc` with the given hypotheses.
-/

-- The calc structure is provided — fill in the justifications.
-- Hint: use `exact h1`, `exact h2`.
theorem calc_trans (f : Nat → Nat)
    (h1 : f 0 ≤ f 1) (h2 : f 1 ≤ f 2) :
    f 0 ≤ f 2 := by
  calc f 0
      _ ≤ f 1 := by sorry
      _ ≤ f 2 := by sorry

-- Mix equality and inequality in a calc chain.
-- Hint: calc a _ = b := by rw [h1] _ ≤ c := by exact h2
theorem calc_mixed (a b c : Nat) (h1 : a = b) (h2 : b ≤ c) :
    a ≤ c := by
  sorry

-- Write a three-step calc chain.
-- Hint: start with `calc f 0` and chain through f 1, f 2, 100.
theorem calc_three (f : Nat → Nat)
    (h1 : f 0 ≤ f 1) (h2 : f 1 ≤ f 2) (h3 : f 2 ≤ 100) :
    f 0 ≤ 100 := by
  sorry
