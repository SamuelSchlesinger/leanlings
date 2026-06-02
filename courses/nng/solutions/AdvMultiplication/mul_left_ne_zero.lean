-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_le_mul_right

namespace MyNat

theorem mul_left_ne_zero (a b : ℕ) (h : a * b ≠ 0) : b ≠ 0 := by
  intro hb
  apply h
  rewrite [hb, mul_zero]
  rfl

end MyNat
