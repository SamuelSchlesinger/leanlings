import RatOrder.add_le_add_left

namespace Analysis
open MyRat

/- The product of two positive rationals is positive. Note `0 < mk a b hb`
becomes `0 < a` (via `zero_def`, `lt_mk`, `omega`). Then `Int.mul_pos` gives
`0 < a * c`, which is what the goal reduces to. -/
theorem MyRat.mul_pos {x y : MyRat} (hx : 0 < x) (hy : 0 < y) : 0 < x * y := by
  sorry

end Analysis
