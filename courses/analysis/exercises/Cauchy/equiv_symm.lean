import Cauchy.equiv_refl

namespace Analysis
open MyRat

/- Symmetry of `CauchyEquiv`. Reuse the `N` from `h`; the only change is
`|g n - f n| = |f n - g n|` (`MyRat.abs_sub_comm`). -/
theorem equiv_symm {f g : ℕ → MyRat} (h : CauchyEquiv f g) : CauchyEquiv g f := by
  sorry

end Analysis
