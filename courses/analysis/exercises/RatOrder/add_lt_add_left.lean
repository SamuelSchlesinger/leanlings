import RatOrder.le_trans

namespace Analysis
open MyRat

/- Adding a constant on the left preserves `<`. After reducing to integers, the
clean way is to rewrite both sides into the shape `P + Q` where the `P` parts are
equal, so that `omega` only needs `Q₁ < Q₂` (which comes from scaling `h` by the
positive `b * b`). Two `grind`-proved equalities `e1`, `e2` set this up. -/
theorem MyRat.add_lt_add_left {y z : MyRat} (x : MyRat) (h : y < z) : x + y < x + z := by
  sorry

end Analysis
