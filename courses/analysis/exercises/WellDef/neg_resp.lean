import WellDef.mul_resp

namespace Analysis

/- Negation respects `r`. It acts on a single fraction, so there is one
hypothesis. -/
theorem PreRat.neg_resp {a b : PreRat} (hab : PreRat.r a b) :
    PreRat.r (PreRat.neg a) (PreRat.neg b) := by
  sorry

end Analysis
