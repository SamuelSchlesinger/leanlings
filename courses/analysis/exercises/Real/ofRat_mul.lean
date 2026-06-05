import Real.ofRat_add

namespace Analysis
open MyReal

/- The embedding preserves `×`. Like `ofRat_add`, with `mul_mk`. -/
theorem MyReal.ofRat_mul (a b : MyRat) : ofRat (a * b) = ofRat a * ofRat b := by
  sorry

end Analysis
