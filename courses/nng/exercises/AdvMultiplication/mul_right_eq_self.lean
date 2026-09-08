-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_left_cancel

namespace MyNat

/-
This finishes the world's cancellation story. Rewrite the single `a` on
the right as `a * 1`, then cancel the nonzero factor using the previous
theorem. Explain why `a = 0` would let every `b` satisfy the hypothesis.
-/
theorem mul_right_eq_self (a b : ℕ) (ha : a ≠ 0) (h : a * b = a) : b = 1 := by
  sorry

end MyNat
