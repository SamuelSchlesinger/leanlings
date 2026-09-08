import RatOrder.add_lt_add_left

namespace Analysis
open MyRat

/- The `≤` version of `add_lt_add_left`. -/
theorem MyRat.add_le_add_left {y z : MyRat} (x : MyRat) (h : y ≤ z) : x + y ≤ x + z := by
  sorry

end Analysis
