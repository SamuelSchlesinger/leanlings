-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.succ_mul

namespace MyNat

/-- Multiplication is commutative. -/
theorem mul_comm
    (a b : ℕ) : a * b = b * a := by
  induction b with d hd
  · rewrite [zero_mul]
    rewrite [mul_zero]
    rfl
  · rewrite [succ_mul]
    rewrite [← hd]
    rewrite [mul_succ]
    rfl

end MyNat
