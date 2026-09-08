import Rat.right_distrib

namespace Analysis
open MyRat

/- The defining property of a field: every nonzero `x` has a multiplicative
inverse. This is the hardest Rat-world level.

The inverse of a fraction has a closed form only when its numerator is
nonzero, so first show that a nonzero rational has a nonzero numerator. The
closed form involves the sign and the absolute value of the numerator; one
integer fact relates those back to the numerator itself. -/
theorem MyRat.mul_inv_cancel (x : MyRat) (hx : x ≠ 0) : x * x⁻¹ = 1 := by
  sorry

end Analysis
