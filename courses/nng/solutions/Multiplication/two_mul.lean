-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.one_mul

namespace MyNat

/-- For any natural number $m$, we have $ 2 \times m = m+m$. -/
theorem two_mul
    (m : ℕ): 2 * m = m + m := by
  rewrite [two_eq_succ_one, succ_mul, one_mul]
  rfl

end MyNat
