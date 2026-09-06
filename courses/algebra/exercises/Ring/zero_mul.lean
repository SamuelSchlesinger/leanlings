import Ring.add_right_cancel

namespace Algebra

/- # Distributivity forces multiplication by zero

Let the repeated expression be `z = 0 * a`. Distributivity shows `z + z = z`.
Rewrite the single `z` as `z + 0` and use additive cancellation. Multiplication
by zero is a consequence of the ring axioms; it was not assumed in the
structure.
-/
theorem zero_mul {R : Type _} [Ring R] (a : R) : 0 * a = 0 := by
  sorry

end Algebra
