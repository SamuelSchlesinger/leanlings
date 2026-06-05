import Setoid.r_refl

namespace Analysis

/- Symmetry of `r`. If `a.num * b.den = b.num * a.den`, then the same holds with
`a` and `b` swapped — pure integer rearrangement.

Tip: `unfold PreRat.r at *` turns the hypothesis and the goal into plain integer
equations; then a single tactic for linear integer goals finishes it. -/
theorem PreRat.r_symm {a b : PreRat} (h : PreRat.r a b) : PreRat.r b a := by
  sorry

end Analysis
