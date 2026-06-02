import CommGroup.inv_comm

namespace Algebra

theorem mul_mul_mul_comm {G : Type _} [CommGroup G] (a b c d : G) : a * b * (c * d) = a * c * (b * d) := by
  rw [mul_assoc, ← mul_assoc b c d, CommGroup.mul_comm b c, mul_assoc c b d, ← mul_assoc]

end Algebra
