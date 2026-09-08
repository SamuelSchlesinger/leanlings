import Setoid.r_refl

namespace Analysis

theorem PreRat.r_symm {a b : PreRat} (h : PreRat.r a b) : PreRat.r b a := by
  exact h.symm

end Analysis
