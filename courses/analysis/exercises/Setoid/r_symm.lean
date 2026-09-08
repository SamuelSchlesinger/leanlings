import Setoid.r_refl

namespace Analysis

/- Symmetry of `r`. If `a.num * b.den = b.num * a.den`, then the same holds with
`a` and `b` swapped. This is symmetry of the very same equality: no
multiplication law is needed.

Tip: `unfold PreRat.r at *` turns the hypothesis and the goal into plain integer
equations. Reverse the evidence with `h.symm` (or let `omega` finish). -/
theorem PreRat.r_symm {a b : PreRat} (h : PreRat.r a b) : PreRat.r b a := by
  sorry

end Analysis
