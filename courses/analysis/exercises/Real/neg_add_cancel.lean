import Real.add_zero

namespace Analysis
open MyReal

/- `-x + x = 0`. Use `neg_mk` and `zero_def`; pointwise it is `MyRat.neg_add_cancel`. -/
theorem MyReal.neg_add_cancel (x : MyReal) : -x + x = 0 := by
  sorry

end Analysis
