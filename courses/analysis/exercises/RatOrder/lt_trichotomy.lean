import RatOrder.lt_trans

namespace Analysis
open MyRat

/- Trichotomy: any two rationals compare. Reduce everything to integers with
`simp only [lt_mk, mk_eq]`; the resulting `_ < _ ∨ _ = _ ∨ _ < _` over `ℤ` is a
job for `omega`. -/
theorem MyRat.lt_trichotomy (x y : MyRat) : x < y ∨ x = y ∨ y < x := by
  sorry

end Analysis
