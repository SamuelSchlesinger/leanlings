import Ring.mul_neg

namespace Algebra

theorem neg_neg {R : Type _} [Ring R] (a : R) : - -a = a := by
  calc - -a = - -a + 0 := by rw [Ring.add_zero]
    _ = - -a + (-a + a) := by rw [Ring.neg_add_cancel]
    _ = - -a + -a + a := by rw [← Ring.add_assoc]
    _ = 0 + a := by rw [Ring.neg_add_cancel]
    _ = a := by rw [Ring.zero_add]

end Algebra
