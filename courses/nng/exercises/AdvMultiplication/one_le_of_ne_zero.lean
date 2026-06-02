-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.eq_succ_of_ne_zero

namespace MyNat

/-
The previous lemma can be used to prove this one.
-/
theorem one_le_of_ne_zero (a : ℕ) (ha : a ≠ 0) : 1 ≤ a := by
  sorry

end MyNat
