import Field.mul_inv_cancel

namespace Algebra

theorem inv_mul_cancel {F : Type _} [Field F] (a : F) (ha : a ≠ 0) : a⁻¹ * a = 1 := by
  rw [CommRing.mul_comm]
  exact Field.mul_inv_cancel a ha

end Algebra
