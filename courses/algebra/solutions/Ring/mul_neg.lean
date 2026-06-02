import Ring.neg_mul

namespace Algebra

theorem mul_neg {R : Type _} [Ring R] (a b : R) : a * -b = -(a * b) := by
  have h : a * -b + a * b = -(a * b) + a * b := by
    rw [← Ring.left_distrib, Ring.neg_add_cancel, mul_zero, Ring.neg_add_cancel]
  exact add_right_cancel (a * -b) (-(a * b)) (a * b) h

end Algebra
