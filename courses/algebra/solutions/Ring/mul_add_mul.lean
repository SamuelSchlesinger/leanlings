import Ring.neg_mul_neg

namespace Algebra

theorem mul_add_mul {R : Type _} [Ring R] (a b c d : R) : (a + b) * (c + d) = a * c + b * c + (a * d + b * d) := by
  rw [Ring.left_distrib, Ring.right_distrib, Ring.right_distrib]

end Algebra
