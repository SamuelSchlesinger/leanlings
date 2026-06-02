import Field.mul_self_eq_zero

namespace Algebra

theorem field_mul_left_cancel {F : Type _} [Field F] (a b c : F) (ha : a ≠ 0) (h : a * b = a * c) : b = c := by
  calc b = 1 * b := by rw [one_mul]
    _ = a⁻¹ * a * b := by rw [inv_mul_cancel a ha]
    _ = a⁻¹ * (a * b) := by rw [mul_assoc]
    _ = a⁻¹ * (a * c) := by rw [h]
    _ = a⁻¹ * a * c := by rw [← mul_assoc]
    _ = 1 * c := by rw [inv_mul_cancel a ha]
    _ = c := by rw [one_mul]

end Algebra
