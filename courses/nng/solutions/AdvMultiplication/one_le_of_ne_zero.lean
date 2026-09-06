-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.eq_succ_of_ne_zero

namespace MyNat

theorem one_le_of_ne_zero (a : ℕ) (ha : a ≠ 0) : 1 ≤ a := by
  have ha := eq_succ_of_ne_zero _ ha
  obtain ⟨n, hn⟩ := ha
  refine ⟨n, ?_⟩
  rewrite [hn, succ_eq_add_one, add_comm]
  rfl

end MyNat
