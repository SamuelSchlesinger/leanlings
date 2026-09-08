import Setoid.r_symm

namespace Analysis

/- Transitivity, the law with real content. The hypotheses mention `b`; the
goal does not. Multiply the goal through by `b.den`, derive that scaled
equation from `hab` and `hbc`, then cancel `b.den`. Positivity of the
denominator is what makes the cancellation legitimate. -/
theorem PreRat.r_trans {a b c : PreRat} (hab : PreRat.r a b) (hbc : PreRat.r b c) :
    PreRat.r a c := by
  sorry

end Analysis
