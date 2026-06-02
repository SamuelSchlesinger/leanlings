/- # Calc 1: Step-by-Step Proofs

  `calc` lets you write proofs as a chain of equalities:

    calc expression
        _ = step1 := by rw [h1]
        _ = step2 := by rw [h2]

  Each step uses `rw [h]` to rewrite with a hypothesis.
  This makes complex proofs readable and structured.

  When goals involve function applications (not just arithmetic),
  `omega` can't help — you need `rw` to step through the chain.

  TODO: Fill in each `sorry` with `rw [...]` using the right hypothesis.
-/

-- The calc structure is provided — fill in the justifications.
-- Hint: use `rw [h1]` and `rw [h2]`.
theorem calc_rewrite (f : Nat → Nat) (h1 : f 0 = 3) (h2 : f 3 = 7) :
    f (f 0) = 7 := by
  calc f (f 0)
      _ = f 3 := by sorry     -- rewrites f 0 to 3
      _ = 7   := by sorry     -- rewrites f 3 to 7

-- Now write your own calc chain from scratch.
-- Start with `calc f 5`, then chain `rw` steps through g.
-- Hint: f 5 → g 5 + 1 → 5 * 2 + 1 → 11
theorem calc_chain (f g : Nat → Nat)
    (h1 : ∀ x, f x = g x + 1)
    (h2 : ∀ x, g x = x * 2) :
    f 5 = 11 := by
  sorry
