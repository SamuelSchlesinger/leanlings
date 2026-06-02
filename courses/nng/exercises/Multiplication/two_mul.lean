-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.one_mul

namespace MyNat

/-
This level is more important than you think; it plays
a useful role when battling a big boss later on.
-/
/-- For any natural number $m$, we have $ 2 \times m = m+m$. -/
theorem two_mul
    (m : ℕ): 2 * m = m + m := by
  sorry

end MyNat
