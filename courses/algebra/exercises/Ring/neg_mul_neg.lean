import Ring.neg_neg

namespace Algebra

/- # Explain why two negative signs cancel

First move one negative sign outside the product using a sign rule, then move
the other using the corresponding rule for its position. The resulting double
negation disappears by `neg_neg`. Choose a rewrite order and inspect the
intermediate expression after each step.
-/
theorem neg_mul_neg {R : Type _} [Ring R] (a b : R) : -a * -b = a * b := by
  sorry

end Algebra
