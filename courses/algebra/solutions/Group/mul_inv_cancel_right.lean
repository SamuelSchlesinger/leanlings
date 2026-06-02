import Group.inv_mul_cancel_right

namespace Algebra

theorem mul_inv_cancel_right {G : Type _} [Group G] (a b : G) : a * b * b⁻¹ = a := by
  rw [mul_assoc, Group.mul_inv_cancel, mul_one]

end Algebra
