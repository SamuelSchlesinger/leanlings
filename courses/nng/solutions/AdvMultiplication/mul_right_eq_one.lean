-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.le_mul_right

namespace MyNat

theorem mul_right_eq_one (x y : ℕ) (h : x * y = 1) : x = 1 := by
  have h2 : x * y ≠ 0 := by rewrite [h]; exact one_ne_zero
  have h2 := le_mul_right _ _ h2
  rewrite [h] at h2
  have h2 := le_one _ h2
  rcases h2 with h0 | h1
  · rewrite [h0, zero_mul] at h
    exact absurd h.symm one_ne_zero
  · exact h1

end MyNat
