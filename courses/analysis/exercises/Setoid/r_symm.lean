import Setoid.r_refl

namespace Analysis

/- Symmetry: if `a` is related to `b`, then `b` is related to `a`. No
arithmetic law is involved. Unfold the relation in the hypothesis and the
goal and compare the two equations. -/
theorem PreRat.r_symm {a b : PreRat} (h : PreRat.r a b) : PreRat.r b a := by
  sorry

end Analysis
