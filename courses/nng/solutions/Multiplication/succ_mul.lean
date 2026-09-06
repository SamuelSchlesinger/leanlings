-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.zero_mul

namespace MyNat

/-- For all natural numbers $a$ and $b$, we have
$(\operatorname{succ}\ a) \times b = a\times b + b$. -/
theorem succ_mul
    (a b : ℕ) : succ a * b = a * b + b := by
  induction b using MyNat.rec' with
  | zero =>
    rewrite [mul_zero]
    rewrite [mul_zero]
    rewrite [add_zero]
    rfl
  | succ d hd =>
    rewrite [mul_succ]
    rewrite [mul_succ]
    rewrite [hd]
    rewrite [add_succ]
    rewrite [add_succ]
    rewrite [add_right_comm]
    rfl

end MyNat
