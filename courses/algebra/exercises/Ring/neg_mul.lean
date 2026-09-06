import Ring.mul_zero

namespace Algebra

/- # Identify the additive inverse of a product

To show `-a * b = -(a * b)`, add `a * b` to both expressions. Distributivity
and `Ring.neg_add_cancel` make the first sum zero; the inverse law makes the
second zero. Additive cancellation then identifies the two candidates.
-/
theorem neg_mul {R : Type _} [Ring R] (a b : R) : -a * b = -(a * b) := by
  sorry

end Algebra
