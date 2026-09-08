import Cauchy.equiv_refl

namespace Analysis
open MyRat

/- Symmetry of `CauchyEquiv`. -/
theorem equiv_symm {f g : ℕ → MyRat} (h : CauchyEquiv f g) : CauchyEquiv g f := by
  sorry

end Analysis
