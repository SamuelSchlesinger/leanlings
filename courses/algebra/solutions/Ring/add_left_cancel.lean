import Ring.add_neg_cancel

namespace Algebra

theorem add_left_cancel {R : Type _} [Ring R] (a b c : R) (h : a + b = a + c) : b = c := by
  calc b = 0 + b := by rw [Ring.zero_add]
    _ = (-a + a) + b := by rw [Ring.neg_add_cancel]
    _ = -a + (a + b) := by rw [Ring.add_assoc]
    _ = -a + (a + c) := by rw [h]
    _ = (-a + a) + c := by rw [← Ring.add_assoc]
    _ = 0 + c := by rw [Ring.neg_add_cancel]
    _ = c := by rw [Ring.zero_add]

end Algebra
