import Cauchy.equiv_symm

namespace Analysis
open MyRat

/- Transitivity of `CauchyEquiv`: another ε/2 argument, with the triangle
inequality in difference form. -/
theorem equiv_trans {f g h : ℕ → MyRat}
    (hfg : CauchyEquiv f g) (hgh : CauchyEquiv g h) : CauchyEquiv f h := by
  sorry

end Analysis
