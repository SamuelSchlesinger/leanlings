import Ring.add_right_cancel

namespace Algebra

theorem zero_mul {R : Type _} [Ring R] (a : R) : 0 * a = 0 := by
  have h : 0 * a + 0 * a = 0 * a + 0 := by
    rw [← Ring.right_distrib, Ring.add_zero, Ring.add_zero]
  exact add_left_cancel (0 * a) (0 * a) 0 h

end Algebra
