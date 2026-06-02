import Ring.neg_neg

namespace Algebra

theorem neg_mul_neg {R : Type _} [Ring R] (a b : R) : -a * -b = a * b := by
  rw [neg_mul, mul_neg, neg_neg]

end Algebra
