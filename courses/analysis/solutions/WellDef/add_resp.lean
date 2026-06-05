import Rat.Quotient

namespace Analysis

theorem PreRat.add_resp {a b c d : PreRat} (hac : PreRat.r a c) (hbd : PreRat.r b d) :
    PreRat.r (PreRat.add a b) (PreRat.add c d) := by
  simp only [PreRat.r, PreRat.add] at *; grind

end Analysis
