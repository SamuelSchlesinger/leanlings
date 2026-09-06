-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_right_eq_one

namespace MyNat

theorem mul_ne_zero (a b : ℕ) (ha : a ≠ 0) (hb : b ≠ 0) : a * b ≠ 0 := by
  have ha := eq_succ_of_ne_zero _ ha
  have hb := eq_succ_of_ne_zero _ hb
  obtain ⟨c, hc⟩ := ha
  obtain ⟨d, hd⟩ := hb
  rewrite [hc, hd]
  rewrite [mul_succ, add_succ]
  symm
  apply zero_ne_succ

end MyNat
