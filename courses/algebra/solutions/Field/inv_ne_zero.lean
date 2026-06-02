import Field.field_inv_one

namespace Algebra

theorem inv_ne_zero {F : Type _} [Field F] (a : F) (ha : a ≠ 0) : a⁻¹ ≠ 0 := by
  intro h
  have hc := Field.mul_inv_cancel a ha
  rw [h, mul_zero] at hc
  exact Field.zero_ne_one hc

end Algebra
