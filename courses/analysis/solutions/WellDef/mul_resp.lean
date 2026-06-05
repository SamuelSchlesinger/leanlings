import WellDef.add_resp

namespace Analysis

theorem PreRat.mul_resp {a b c d : PreRat} (hac : PreRat.r a c) (hbd : PreRat.r b d) :
    PreRat.r (PreRat.mul a b) (PreRat.mul c d) := by
  simp only [PreRat.r, PreRat.mul] at *; grind

end Analysis
