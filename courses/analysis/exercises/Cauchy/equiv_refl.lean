import Cauchy.neg_isCauchy

namespace Analysis
open MyRat

/- `CauchyEquiv` (difference tends to 0) is an equivalence relation; the next
three levels prove it. Reflexivity is like `const_isCauchy`: `f n - f n = 0`. -/
theorem equiv_refl (f : ℕ → MyRat) : CauchyEquiv f f := by
  sorry

end Analysis
