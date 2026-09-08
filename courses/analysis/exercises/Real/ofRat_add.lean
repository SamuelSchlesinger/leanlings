import Real.left_distrib

namespace Analysis
open MyReal

/- The embedding `ℚ ↪ ℝ` preserves `+`. Both sides are constant sequences. -/
theorem MyReal.ofRat_add (a b : MyRat) : ofRat (a + b) = ofRat a + ofRat b := by
  sorry

end Analysis
