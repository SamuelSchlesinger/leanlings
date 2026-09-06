import Field.inv_ne_zero

namespace Algebra

/- # A product of nonzero elements stays nonzero

Assume the product is zero and undo the factor `a` by multiplying with `a⁻¹`.
Use `ha` to justify cancellation. The resulting equation `b = 0` contradicts
`hb`. Both nonzero hypotheses have a distinct role in this argument.
-/
theorem mul_ne_zero {F : Type _} [Field F] (a b : F) (ha : a ≠ 0) (hb : b ≠ 0) : a * b ≠ 0 := by
  sorry

end Algebra
