/- # Reuse inverse reasoning for addition

A ring has two operations. Addition has zero, negatives, associativity,
and commutativity. Multiplication is a monoid operation tied to addition
by `Ring.left_distrib` and `Ring.right_distrib`.

The supplied additive inverse law is `Ring.neg_add_cancel : -a + a = 0`.
The goal places the negative on the other side. Use the commutativity
of addition to derive this form. Multiplication need not be commutative.
-/
import Hom.map_div

namespace Algebra

theorem add_neg_cancel {R : Type _} [Ring R] (a : R) : a + -a = 0 := by
  sorry

end Algebra
