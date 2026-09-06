import Ring.mul_add_mul

namespace Algebra

/- # Zero is its own additive inverse

Specialize the additive inverse law to zero. Simplifying the addition by zero
leaves precisely the desired equality. Compare with `inv_one` in the group unit
to see the same uniqueness idea in additive notation.
-/
theorem neg_zero {R : Type _} [Ring R] : -(0 : R) = 0 := by
  sorry

end Algebra
