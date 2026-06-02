import CommGroup.mul_inv

namespace Algebra

theorem mul_left_comm {G : Type _} [CommGroup G] (a b c : G) : a * (b * c) = b * (a * c) := by
  rw [← mul_assoc, CommGroup.mul_comm a b, mul_assoc]

end Algebra
