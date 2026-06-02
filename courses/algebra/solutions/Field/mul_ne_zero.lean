import Field.inv_ne_zero

namespace Algebra

theorem mul_ne_zero {F : Type _} [Field F] (a b : F) (ha : a ≠ 0) (hb : b ≠ 0) : a * b ≠ 0 := by
  intro hab
  apply hb
  calc b = 1 * b := by rw [one_mul]
    _ = a⁻¹ * a * b := by rw [inv_mul_cancel a ha]
    _ = a⁻¹ * (a * b) := by rw [mul_assoc]
    _ = a⁻¹ * 0 := by rw [hab]
    _ = 0 := by rw [mul_zero]

end Algebra
