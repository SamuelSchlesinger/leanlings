import Group.inv_mul_cancel_left

namespace Algebra

theorem mul_inv_cancel_left {G : Type _} [Group G] (a b : G) : a * (a⁻¹ * b) = b := by
  rw [← mul_assoc, Group.mul_inv_cancel, one_mul]

end Algebra
