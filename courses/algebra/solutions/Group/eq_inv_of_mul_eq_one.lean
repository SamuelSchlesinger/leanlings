import Group.inv_inj

namespace Algebra

theorem eq_inv_of_mul_eq_one {G : Type _} [Group G] (a b : G) (h : a * b = 1) : b = a⁻¹ := by
  calc b = 1 * b := by rw [one_mul]
    _ = a⁻¹ * a * b := by rw [Group.inv_mul_cancel]
    _ = a⁻¹ * (a * b) := by rw [mul_assoc]
    _ = a⁻¹ * 1 := by rw [h]
    _ = a⁻¹ := by rw [mul_one]

end Algebra
