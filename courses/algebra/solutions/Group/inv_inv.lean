import Group.inv_one

namespace Algebra

theorem inv_inv {G : Type _} [Group G] (a : G) : a⁻¹⁻¹ = a := by
  calc a⁻¹⁻¹ = a⁻¹⁻¹ * 1 := by rw [mul_one]
    _ = a⁻¹⁻¹ * (a⁻¹ * a) := by rw [Group.inv_mul_cancel]
    _ = a⁻¹⁻¹ * a⁻¹ * a := by rw [← mul_assoc]
    _ = 1 * a := by rw [Group.inv_mul_cancel]
    _ = a := by rw [one_mul]

end Algebra
