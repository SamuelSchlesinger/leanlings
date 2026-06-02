import Group.inv_eq_of_mul_eq_one

namespace Algebra

theorem mul_inv_rev {G : Type _} [Group G] (a b : G) : (a * b)⁻¹ = b⁻¹ * a⁻¹ := by
  have key : (a * b) * (b⁻¹ * a⁻¹) = 1 := by
    calc (a * b) * (b⁻¹ * a⁻¹) = a * (b * (b⁻¹ * a⁻¹)) := by rw [mul_assoc]
      _ = a * (b * b⁻¹ * a⁻¹) := by rw [← mul_assoc b b⁻¹ a⁻¹]
      _ = a * (1 * a⁻¹) := by rw [Group.mul_inv_cancel]
      _ = a * a⁻¹ := by rw [one_mul]
      _ = 1 := by rw [Group.mul_inv_cancel]
  exact (eq_inv_of_mul_eq_one (a * b) (b⁻¹ * a⁻¹) key).symm

end Algebra
