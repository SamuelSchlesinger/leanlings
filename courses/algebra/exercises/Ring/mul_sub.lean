import Ring.sub_zero

namespace Algebra

/- # Distribute across a difference

Expand the two subtractions into addition of negatives. Distribute
multiplication over the sum, then move the negative sign out of the second
factor. Identify where `Ring.left_distrib` and `mul_neg` match before
rewriting.
-/
theorem mul_sub {R : Type _} [Ring R] (a b c : R) : a * (b - c) = a * b - a * c := by
  sorry

end Algebra
