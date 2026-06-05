import Cauchy.equiv_symm

namespace Analysis
open MyRat

/- Transitivity of `CauchyEquiv` — another ε/2 argument, now with the triangle
inequality in difference form: `MyRat.abs_sub_le (f n) (g n) (h n)` gives
`|f n - h n| ≤ |f n - g n| + |g n - h n|`. Split `ε` with `exists_half`, take a
`Nat.max`, and `calc` to the finish. -/
theorem equiv_trans {f g h : ℕ → MyRat}
    (hfg : CauchyEquiv f g) (hgh : CauchyEquiv g h) : CauchyEquiv f h := by
  sorry

end Analysis
