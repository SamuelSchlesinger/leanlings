import WellDef.mul_resp

namespace Analysis

theorem PreRat.neg_resp {a b : PreRat} (hab : PreRat.r a b) :
    PreRat.r (PreRat.neg a) (PreRat.neg b) := by
  simp only [PreRat.r, PreRat.neg] at *; grind

end Analysis
