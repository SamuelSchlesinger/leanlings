import Group.mul_inv_rev

namespace Algebra

theorem eq_of_mul_inv_eq_one {G : Type _} [Group G] (a b : G) (h : a * b⁻¹ = 1) : a = b := by
  calc a = a * 1 := by rw [mul_one]
    _ = a * (b⁻¹ * b) := by rw [Group.inv_mul_cancel]
    _ = a * b⁻¹ * b := by rw [← mul_assoc]
    _ = 1 * b := by rw [h]
    _ = b := by rw [one_mul]

end Algebra
