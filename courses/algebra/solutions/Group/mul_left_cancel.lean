import Monoid.bool_one

namespace Algebra

theorem mul_left_cancel {G : Type _} [Group G] (a b c : G) (h : a * b = a * c) : b = c := by
  calc b = 1 * b := by rw [one_mul]
    _ = a⁻¹ * a * b := by rw [Group.inv_mul_cancel]
    _ = a⁻¹ * (a * b) := by rw [mul_assoc]
    _ = a⁻¹ * (a * c) := by rw [h]
    _ = a⁻¹ * a * c := by rw [← mul_assoc]
    _ = 1 * c := by rw [Group.inv_mul_cancel]
    _ = c := by rw [one_mul]

end Algebra
