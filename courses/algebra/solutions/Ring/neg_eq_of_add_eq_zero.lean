import Ring.neg_zero

namespace Algebra

theorem neg_eq_of_add_eq_zero {R : Type _} [Ring R] (a b : R) (h : a + b = 0) : -a = b := by
  calc -a = -a + 0 := by rw [Ring.add_zero]
    _ = -a + (a + b) := by rw [h]
    _ = -a + a + b := by rw [← Ring.add_assoc]
    _ = 0 + b := by rw [Ring.neg_add_cancel]
    _ = b := by rw [Ring.zero_add]

end Algebra
