-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.two_mul

namespace MyNat

/-
Our next goal is "left and right distributivity",
meaning $a(b+c)=ab+ac$ and $(b+c)a=ba+ca$. Rather than
these slightly pompous names, the name of the proofs
in Lean are descriptive. Let's start with
`mul_add a b c`, the proof of `a * (b + c) = a * b + a * c`.
Note that the left hand side contains a multiplication
and then an addition.
-/
/-- Multiplication is distributive over addition on the left.
In other words, for all natural numbers $a$, $b$ and $c$, we have
$a(b + c) = ab + ac$. -/
theorem mul_add
    (a b c : ℕ) : a * (b + c) = a * b + a * c := by
  sorry

end MyNat
