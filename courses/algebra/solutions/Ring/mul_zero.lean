import Ring.zero_mul

namespace Algebra

theorem mul_zero {R : Type _} [Ring R] (a : R) : a * 0 = 0 := by
  have h : a * 0 + a * 0 = a * 0 + 0 := by
    rw [← Ring.left_distrib, Ring.add_zero, Ring.add_zero]
  exact add_left_cancel (a * 0) (a * 0) 0 h

end Algebra
