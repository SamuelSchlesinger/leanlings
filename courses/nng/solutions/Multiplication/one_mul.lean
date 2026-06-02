-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.mul_comm

namespace MyNat

/-- For any natural number $m$, we have $ 1 \times m = m$. -/
theorem one_mul
    (m : ℕ): 1 * m = m := by
  rewrite [mul_comm, mul_one]
  rfl

end MyNat
