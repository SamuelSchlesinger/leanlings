-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_eq_zero

namespace MyNat

/-
In this level we prove that if `a * b = a * c` and `a ≠ 0` then `b = c`. It is tricky, for
several reasons. One of these is that
we need to introduce a new idea: we will need to understand the concept of
mathematical induction a little better.

Starting with `induction b using MyNat.rec'` is too naive, because in the inductive step
the hypothesis is `a * d = a * c → d = c` but what we know is `a * succ d = a * c`,
so the induction hypothesis does not apply!

Assume `a ≠ 0` is fixed. The actual statement we want to prove by induction on `b` is
"for all `c`, if `a * b = a * c` then `b = c`". This *can* be proved by induction,
because we now have the flexibility to change `c`.
-/
theorem mul_left_cancel (a b c : ℕ) (ha : a ≠ 0) (h : a * b = a * c) : b = c := by
  sorry

end MyNat
