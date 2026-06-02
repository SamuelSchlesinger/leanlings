-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_left_cancel

namespace MyNat

theorem mul_right_eq_self (a b : ℕ) (ha : a ≠ 0) (h : a * b = a) : b = 1 := by
  nth_rewrite 2 [← mul_one a] at h
  exact mul_left_cancel a b 1 ha h

end MyNat
