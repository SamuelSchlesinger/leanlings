import Ring.neg_mul_neg

namespace Algebra

/- # Expand without changing factor order

Distribute over `c + d`, then over `a + b` in each term. The target
deliberately keeps `a * c`, `b * c`, `a * d`, and `b * d` in that order. This
identity holds even when multiplication is not commutative; no factor may be
swapped.
-/
theorem mul_add_mul {R : Type _} [Ring R] (a b c d : R) : (a + b) * (c + d) = a * c + b * c + (a * d + b * d) := by
  sorry

end Algebra
