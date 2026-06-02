import Group.mul_left_cancel

namespace Algebra

theorem mul_right_cancel {G : Type _} [Group G] (a b c : G) (h : a * c = b * c) : a = b := by
  calc a = a * 1 := by rw [mul_one]
    _ = a * (c * c⁻¹) := by rw [Group.mul_inv_cancel]
    _ = a * c * c⁻¹ := by rw [← mul_assoc]
    _ = b * c * c⁻¹ := by rw [h]
    _ = b * (c * c⁻¹) := by rw [mul_assoc]
    _ = b * 1 := by rw [Group.mul_inv_cancel]
    _ = b := by rw [mul_one]

end Algebra
