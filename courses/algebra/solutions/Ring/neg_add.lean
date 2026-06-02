import Ring.neg_eq_of_add_eq_zero

namespace Algebra

theorem neg_add {R : Type _} [Ring R] (a b : R) : -(a + b) = -b + -a := by
  have key : (a + b) + (-b + -a) = 0 := by
    calc (a + b) + (-b + -a) = a + (b + (-b + -a)) := by rw [Ring.add_assoc]
      _ = a + (b + -b + -a) := by rw [← Ring.add_assoc b (-b) (-a)]
      _ = a + (0 + -a) := by rw [add_neg_cancel]
      _ = a + -a := by rw [Ring.zero_add]
      _ = 0 := by rw [add_neg_cancel]
  exact neg_eq_of_add_eq_zero (a + b) (-b + -a) key

end Algebra
