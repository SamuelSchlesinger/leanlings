-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_le_mul_right

namespace MyNat

/-
If you have completed Algorithm World then you can use the `contrapose!` tactic
here. If not then I'll talk you through a manual approach.
-/
theorem mul_left_ne_zero (a b : ℕ) (h : a * b ≠ 0) : b ≠ 0 := by
  sorry

end MyNat
