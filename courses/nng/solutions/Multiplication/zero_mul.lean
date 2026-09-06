-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.mul_one

namespace MyNat

/-- For all natural numbers $m$, we have $ 0 \times m = 0$. -/
theorem zero_mul
    (m : ℕ) : 0 * m = 0 := by
  induction m using MyNat.rec' with
  | zero =>
    rewrite [mul_zero]
    rfl
  | succ d hd =>
    rewrite [mul_succ]
    rewrite [hd]
    rewrite [add_zero]
    rfl

end MyNat
