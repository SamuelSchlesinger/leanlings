-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_two

namespace MyNat

/-
Let's warm up with an easy one, which works even if `t = 0`.
-/
theorem mul_le_mul_right (a b t : ℕ) (h : a ≤ b) : a * t ≤ b * t := by
  sorry

end MyNat
