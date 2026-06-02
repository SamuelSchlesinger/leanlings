-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.mul_one

namespace MyNat

/-
Our first challenge is `mul_comm x y : x * y = y * x`,
and we want to prove it by induction. The zero
case will need `mul_zero` (which we have)
and `zero_mul` (which we don't), so let's
start with this.
-/
/-- For all natural numbers $m$, we have $ 0 \times m = 0$. -/
theorem zero_mul
    (m : ℕ) : 0 * m = 0 := by
  sorry

end MyNat
