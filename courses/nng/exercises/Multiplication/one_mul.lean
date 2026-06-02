-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.mul_comm

namespace MyNat

/-
You can prove $1\times m=m$ in at least three ways.
Either by induction, or by using `succ_mul`, or
by using commutativity. Which do you think is quickest?
-/
/-- For any natural number $m$, we have $ 1 \times m = m$. -/
theorem one_mul
    (m : ℕ): 1 * m = m := by
  sorry

end MyNat
