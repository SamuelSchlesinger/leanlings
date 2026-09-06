import Ring.zero_mul

namespace Algebra

/- # Use the other distributive law

Study `a * (0 + 0)`. Distributing it gives two copies of `a * 0`, while
simplifying inside first gives one. Turn that equation into an additive
cancellation argument. The proof needs left distributivity because the sum is
the right input of multiplication.
-/
theorem mul_zero {R : Type _} [Ring R] (a : R) : a * 0 = 0 := by
  sorry

end Algebra
