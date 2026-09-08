import RatOrder.le_trans

namespace Analysis
open MyRat

/- Adding a constant on the left preserves `<`. After clearing denominators
the two sides share a term; separate it from the part that is the
hypothesis scaled by a positive factor. -/
theorem MyRat.add_lt_add_left {y z : MyRat} (x : MyRat) (h : y < z) : x + y < x + z := by
  sorry

end Analysis
