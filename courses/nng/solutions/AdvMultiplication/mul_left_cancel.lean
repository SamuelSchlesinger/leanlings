-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_eq_zero

namespace MyNat

theorem mul_left_cancel (a b c : ℕ) (ha : a ≠ 0) (h : a * b = a * c) : b = c := by
  induction b using MyNat.rec' generalizing c with
  | zero =>
    rewrite [mul_zero] at h
    have h := Eq.symm h
    have h := mul_eq_zero _ _ h
    rcases h with h1 | h2
    · exact absurd h1 ha
    · rewrite [h2]
      rfl
  | succ d hd =>
    cases c using MyNat.casesOn' with
    | zero =>
      rewrite [mul_succ, mul_zero] at h
      have h := add_left_eq_zero _ _ h
      exact absurd h ha
    | succ e =>
      rewrite [mul_succ, mul_succ] at h
      have h := add_right_cancel _ _ _ h
      have h := hd _ h
      rewrite [h]
      rfl

end MyNat
