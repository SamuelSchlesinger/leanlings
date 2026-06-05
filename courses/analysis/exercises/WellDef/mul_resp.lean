import WellDef.add_resp

namespace Analysis

/- Multiplication respects `r`. Same pattern as `add_resp`, with `PreRat.mul`
in place of `PreRat.add`. -/
theorem PreRat.mul_resp {a b c d : PreRat} (hac : PreRat.r a c) (hbd : PreRat.r b d) :
    PreRat.r (PreRat.mul a b) (PreRat.mul c d) := by
  sorry

end Analysis
