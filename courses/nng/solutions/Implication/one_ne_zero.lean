-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.zero_ne_one

namespace MyNat

/-- $1\neq0$. -/
theorem one_ne_zero : (1 : ℕ) ≠ 0 := by
  symm
  exact zero_ne_one

end MyNat
