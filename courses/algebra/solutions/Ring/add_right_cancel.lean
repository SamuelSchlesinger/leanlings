import Ring.add_left_cancel

namespace Algebra

theorem add_right_cancel {R : Type _} [Ring R] (a b c : R) (h : a + c = b + c) : a = b := by
  calc a = a + 0 := by rw [Ring.add_zero]
    _ = a + (c + -c) := by rw [add_neg_cancel]
    _ = a + c + -c := by rw [← Ring.add_assoc]
    _ = b + c + -c := by rw [h]
    _ = b + (c + -c) := by rw [Ring.add_assoc]
    _ = b + 0 := by rw [add_neg_cancel]
    _ = b := by rw [Ring.add_zero]

end Algebra
