import CommGroup.mul_right_comm

namespace Algebra

theorem mul_inv_cancel_right {G : Type _} [CommGroup G] (a b : G) : a * b * b⁻¹ = a := by
  rw [mul_assoc, Group.mul_inv_cancel, mul_one]

end Algebra
