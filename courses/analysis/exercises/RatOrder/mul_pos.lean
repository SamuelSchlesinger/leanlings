import RatOrder.add_le_add_left

namespace Analysis
open MyRat

/- The product of two positive rationals is positive. Note what `0 < mk a b hb`
says about `a`. -/
theorem MyRat.mul_pos {x y : MyRat} (hx : 0 < x) (hy : 0 < y) : 0 < x * y := by
  sorry

end Analysis
