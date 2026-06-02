import Field.mul_ne_zero

namespace Algebra

theorem mul_eq_zero {F : Type _} [Field F] (a b : F) (h : a * b = 0) : a = 0 ∨ b = 0 := by
  rcases Classical.em (a = 0) with ha | ha
  · exact Or.inl ha
  · apply Or.inr
    calc b = 1 * b := by rw [one_mul]
      _ = a⁻¹ * a * b := by rw [inv_mul_cancel a ha]
      _ = a⁻¹ * (a * b) := by rw [mul_assoc]
      _ = a⁻¹ * 0 := by rw [h]
      _ = 0 := by rw [mul_zero]

end Algebra
