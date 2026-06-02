-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_eq_zero

namespace MyNat

theorem mul_left_cancel (a b c : ℕ) (ha : a ≠ 0) (h : a * b = a * c) : b = c := by
  induction b using MyNat.rec' generalizing c with
  | zero =>
    rewrite [mul_zero] at h
    symm at h
    apply mul_eq_zero at h
    cases h with h1 h2
    · exact absurd h1 ha
    · rewrite [h2]
      rfl
  | succ d hd =>
    cases c with e
    · rewrite [mul_succ, mul_zero] at h
      apply add_left_eq_zero at h
      exact absurd h ha
    · rewrite [mul_succ, mul_succ] at h
      apply add_right_cancel at h
      apply hd at h
      rewrite [h]
      rfl

end MyNat
