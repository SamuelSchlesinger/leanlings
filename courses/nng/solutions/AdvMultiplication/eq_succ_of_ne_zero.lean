-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_left_ne_zero

namespace MyNat

theorem eq_succ_of_ne_zero (a : ℕ) (ha : a ≠ 0) : ∃ n, a = succ n := by
  cases a using MyNat.casesOn' with
  | zero => exact absurd rfl ha
  | succ d => exact ⟨d, rfl⟩

end MyNat
