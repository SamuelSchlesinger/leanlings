import Ring.mul_zero

namespace Algebra

theorem neg_mul {R : Type _} [Ring R] (a b : R) : -a * b = -(a * b) := by
  have h : -a * b + a * b = -(a * b) + a * b := by
    rw [← Ring.right_distrib, Ring.neg_add_cancel, zero_mul, Ring.neg_add_cancel]
  exact add_right_cancel (-a * b) (-(a * b)) (a * b) h

end Algebra
