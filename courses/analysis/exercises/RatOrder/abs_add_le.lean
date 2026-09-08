import RatOrder.abs_mul

namespace Analysis
open MyRat

/- The triangle inequality `|x + y| ≤ |x| + |y|`, the cornerstone of everything
that follows: it is what makes distances work.

After clearing denominators this is the integer triangle inequality for
`natAbs`, applied to the two cross-products, then scaled by the positive
product of the denominators. Prove the unscaled integer inequality as a
separate `have` before scaling it. -/
theorem MyRat.abs_add_le (x y : MyRat) : |x + y| ≤ |x| + |y| := by
  sorry

end Analysis
