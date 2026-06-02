-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_right_eq_one

namespace MyNat

theorem mul_ne_zero (a b : ℕ) (ha : a ≠ 0) (hb : b ≠ 0) : a * b ≠ 0 := by
  apply eq_succ_of_ne_zero at ha
  apply eq_succ_of_ne_zero at hb
  cases ha with c hc
  cases hb with d hd
  rewrite [hc, hd]
  rewrite [mul_succ, add_succ]
  symm
  apply zero_ne_succ

end MyNat
