import Real.Limit

namespace Analysis
open MyReal

/- # Capstone — ℝ is complete over ℚ

You have ℝ as an ordered ring with `|·|`. The unit notes explain how its
order is defined through positivity, and how a strict inequality between
reals is proved from a representative.

Warm-up: a positive rational embeds to a positive real. -/
theorem MyReal.ofRat_pos {q : MyRat} (hq : 0 < q) : (0 : MyReal) < ofRat q := by
  sorry

end Analysis
