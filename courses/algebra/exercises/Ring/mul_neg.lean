import Ring.neg_mul

namespace Algebra

/- # Move a sign out of the second factor

As before, compare the proposed negative with the additive inverse of `a * b`
by adding `a * b` to both. This time the useful distributive law expands `a *
(-b + b)`. Multiplicative commutativity is unavailable, so the preceding sign
rule alone cannot swap the two inputs.
-/
theorem mul_neg {R : Type _} [Ring R] (a b : R) : a * -b = -(a * b) := by
  sorry

end Algebra
