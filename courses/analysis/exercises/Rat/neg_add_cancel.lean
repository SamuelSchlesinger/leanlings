import Rat.add_zero

namespace Analysis
open MyRat

/- `-x + x = 0`. Expose `-x` with `neg_mk` and `0` with `zero_def`. -/
theorem MyRat.neg_add_cancel (x : MyRat) : -x + x = 0 := by
  sorry

end Analysis
