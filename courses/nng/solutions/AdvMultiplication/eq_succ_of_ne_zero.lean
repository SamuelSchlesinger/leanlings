-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_left_ne_zero

namespace MyNat

theorem eq_succ_of_ne_zero (a : ℕ) (ha : a ≠ 0) : ∃ n, a = succ n := by
  cases a with d
  · exact absurd rfl ha
  · use d
    rfl

end MyNat
