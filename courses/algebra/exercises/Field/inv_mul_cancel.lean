import Field.mul_inv_cancel

namespace Algebra

/- # Cancel in the opposite order

The field axiom states `a * a⁻¹ = 1` for nonzero `a`. Commute the two factors
to match this goal, then pass the hypothesis `ha` to the axiom. Notice that a
field supplies a commutative ring, but not a group on all its elements.
-/
theorem inv_mul_cancel {F : Type _} [Field F] (a : F) (ha : a ≠ 0) : a⁻¹ * a = 1 := by
  sorry

end Algebra
