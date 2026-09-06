-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.two_mul

namespace MyNat

/-- Multiplication is distributive over addition on the left.
In other words, for all natural numbers $a$, $b$ and $c$, we have
$a(b + c) = ab + ac$. -/
theorem mul_add
    (a b c : ℕ) : a * (b + c) = a * b + a * c := by
  induction c using MyNat.rec' with
  | zero =>
    rewrite [add_zero, mul_zero, add_zero]
    rfl
  | succ d hd =>
    rewrite [add_succ, mul_succ, hd, mul_succ, add_assoc]
    rfl

end MyNat
