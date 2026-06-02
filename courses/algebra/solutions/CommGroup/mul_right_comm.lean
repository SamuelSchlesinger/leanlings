import CommGroup.mul_left_comm

namespace Algebra

theorem mul_right_comm {G : Type _} [CommGroup G] (a b c : G) : a * b * c = a * c * b := by
  rw [mul_assoc, CommGroup.mul_comm b c, ← mul_assoc]

end Algebra
