import WellDef.mul_resp

namespace Analysis

/- Negation respects `r`. Again the same pattern, now with `PreRat.neg`
(which only touches a single fraction). -/
theorem PreRat.neg_resp {a b : PreRat} (hab : PreRat.r a b) :
    PreRat.r (PreRat.neg a) (PreRat.neg b) := by
  sorry

end Analysis
