-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_ne_zero

namespace MyNat

theorem mul_eq_zero (a b : ℕ) (h : a * b = 0) : a = 0 ∨ b = 0 := by
  rcases Classical.em (a = 0) with ha | ha
  · left
    exact ha
  · right
    rcases Classical.em (b = 0) with hb | hb
    · exact hb
    · exact absurd h (mul_ne_zero a b ha hb)

end MyNat
