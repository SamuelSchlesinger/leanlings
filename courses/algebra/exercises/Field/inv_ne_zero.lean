import Field.field_inv_one

namespace Algebra

/- # An inverse of a nonzero element cannot vanish

Assume `a⁻¹ = 0`. The product `a * a⁻¹` would then be zero by `mul_zero`, but
`ha` makes the inverse law identify it with `1`. Derive the contradiction with
`Field.zero_ne_one`, paying attention to the orientation of the resulting
equality.
-/
theorem inv_ne_zero {F : Type _} [Field F] (a : F) (ha : a ≠ 0) : a⁻¹ ≠ 0 := by
  sorry

end Algebra
