-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_le_mul_right

namespace MyNat

/-
The goal `b ≠ 0` means `b = 0 → False`. Introduce the assumption `b = 0`
and work out what it says about `a * b`. That contradicts `h`.
-/
theorem mul_left_ne_zero (a b : ℕ) (h : a * b ≠ 0) : b ≠ 0 := by
  sorry

end MyNat
