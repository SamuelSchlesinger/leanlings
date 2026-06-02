import Field.inv_mul_cancel

namespace Algebra

theorem field_inv_one {F : Type _} [Field F] : (1 : F)⁻¹ = 1 := by
  have h1 : (1 : F) ≠ 0 := fun h => Field.zero_ne_one h.symm
  have h := Field.mul_inv_cancel (1 : F) h1
  rw [one_mul] at h
  exact h

end Algebra
