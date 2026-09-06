# Two operations tied together

A **ring** has commutative addition with zero and additive inverses, and
associative multiplication with an identity. Multiplication distributes over
addition. Its multiplication need not be commutative, and nonzero elements
need not have multiplicative inverses.

```lean
import AlgebraLib.Prelude
open Algebra
example {R : Type} [Ring R] (a b : R) : a * (b + 0) = a * b := by
  rw [Ring.add_zero]
```

Names make the chosen law explicit: `Ring.add_assoc`, `Ring.add_comm`,
`Ring.left_distrib`, and `Ring.right_distrib`. Subtraction is defined as
addition of a negative; expand it using `sub_eq`.

Several proofs reuse group reasoning in additive form. Translate identity to
zero, inverse to negation, and multiplication to addition. To prove
`0 * a = 0`, first show that adding two copies of `0 * a` changes nothing,
using distributivity. Then cancellation tells you that one copy is zero.

Before a sign-rule proof, decide which sum should become zero. This gives
you an intermediate equality to aim for.
