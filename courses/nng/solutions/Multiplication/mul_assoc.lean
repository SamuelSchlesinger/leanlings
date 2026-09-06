-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.add_mul

namespace MyNat

/-- Multiplication is associative.
In other words, for all natural numbers $a$, $b$ and $c$, we have
$(ab)c = a(bc)$. -/
theorem mul_assoc
    (a b c : ℕ) : (a * b) * c = a * (b * c) := by
  induction c using MyNat.rec' with
  | zero =>
    rewrite [mul_zero, mul_zero, mul_zero]
    rfl
  | succ d hd =>
    rewrite [mul_succ]
    rewrite [mul_succ]
    rewrite [hd]
    rewrite [mul_add]
    rfl

end MyNat
