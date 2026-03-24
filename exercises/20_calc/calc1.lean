/- # Calc 1: Step-by-Step Proofs

  `calc` lets you write proofs as a chain of equalities
  (or inequalities):

    calc a
        _ = b := by ...
        _ = c := by ...
        _ = d := by ...

  Each step transforms the expression. The proof of each
  step justifies the transformation.

  TODO: Complete these calculational proofs.
-/

-- Prove using a chain of equalities
theorem calc_example (a b c : Nat) (h1 : a = b + 1) (h2 : b = c + 2) :
    a = c + 3 := by
  sorry

-- A more involved calculation
theorem calc_arith (n : Nat) : (n + 1) * 2 = n * 2 + 2 := by
  sorry
