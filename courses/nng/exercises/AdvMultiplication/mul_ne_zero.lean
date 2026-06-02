-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_right_eq_one

namespace MyNat

/-
This level proves that if `a ≠ 0` and `b ≠ 0` then `a * b ≠ 0`. One strategy
is to write both `a` and `b` as `succ` of something, deduce that `a * b` is
also `succ` of something, and then `apply zero_ne_succ`.
-/
theorem mul_ne_zero (a b : ℕ) (ha : a ≠ 0) (hb : b ≠ 0) : a * b ≠ 0 := by
  sorry

end MyNat
