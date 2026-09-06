import Field.inv_mul_cancel

namespace Algebra

/- # Prove the side condition before using an inverse

To apply the inverse law at `1`, establish `1 ≠ 0` from `Field.zero_ne_one`.
Then simplify multiplication by `1`. The earlier group proof had no side
condition; this version makes explicit why the same reasoning is valid for the
field identity.
-/
theorem field_inv_one {F : Type _} [Field F] : (1 : F)⁻¹ = 1 := by
  sorry

end Algebra
