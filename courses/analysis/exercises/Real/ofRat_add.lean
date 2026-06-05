import Real.left_distrib

namespace Analysis
open MyReal

/- The embedding `ℚ ↪ ℝ` preserves `+`. Unfold with `ofRat_def`, then `add_mk`; the
two constant sequences are pointwise equal, so `fun n => rfl` works. -/
theorem MyReal.ofRat_add (a b : MyRat) : ofRat (a + b) = ofRat a + ofRat b := by
  sorry

end Analysis
