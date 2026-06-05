import Real.add_assoc

namespace Analysis
open MyReal

/- `0 + x = x`. Use `zero_def` to expose `0` as the constant-`0` sequence; the
pointwise fact is `MyRat.zero_add`. -/
theorem MyReal.zero_add (x : MyReal) : 0 + x = x := by
  sorry

end Analysis
