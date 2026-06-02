-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_left_cancel

namespace MyNat

/-
The lemma proved in the final level of this world will be helpful
in Divisibility World.
-/
theorem mul_right_eq_self (a b : ℕ) (ha : a ≠ 0) (h : a * b = a) : b = 1 := by
  sorry

end MyNat
