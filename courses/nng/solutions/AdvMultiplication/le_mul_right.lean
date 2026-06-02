-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.one_le_of_ne_zero

namespace MyNat

theorem le_mul_right (a b : ℕ) (h : a * b ≠ 0) : a ≤ a * b := by
  apply mul_left_ne_zero at h
  apply one_le_of_ne_zero at h
  apply mul_le_mul_right 1 b a at h
  rewrite [one_mul, mul_comm] at h
  exact h

end MyNat
