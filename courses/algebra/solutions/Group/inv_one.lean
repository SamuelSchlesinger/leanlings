import Group.mul_inv_cancel_left

namespace Algebra

theorem inv_one {G : Type _} [Group G] : (1 : G)⁻¹ = 1 := by
  have h := Group.inv_mul_cancel (1 : G)
  rw [mul_one] at h
  exact h

end Algebra
