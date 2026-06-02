/- Field world.
   A field is a commutative ring in which every nonzero element has an inverse:
   `Field.mul_inv_cancel : a ≠ 0 → a * a⁻¹ = 1`, with `Field.zero_ne_one`. -/
import CommRing.sq_expand

namespace Algebra

theorem mul_inv_cancel {F : Type _} [Field F] (a : F) (ha : a ≠ 0) : a * a⁻¹ = 1 := by
  sorry

end Algebra
