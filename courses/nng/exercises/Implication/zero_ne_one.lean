-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.ne

namespace MyNat

/-
As warm-up for `2 + 2 ≠ 5` let's prove `0 ≠ 1`. To do this we need to
introduce Peano's last axiom `zero_ne_succ n`, a proof that `0 ≠ succ n`.
-/
/-- $0\neq1$. -/
theorem zero_ne_one : (0 : ℕ) ≠ 1 := by
  sorry

end MyNat
