import Real.mul_one

namespace Analysis
open MyReal

/- Distributivity on ℝ. Needs `add_mk` and `mul_mk`; pointwise `MyRat.left_distrib`. -/
theorem MyReal.left_distrib (x y z : MyReal) : x * (y + z) = x * y + x * z := by
  sorry

end Analysis
