import RatOrder.abs_nonneg

namespace Analysis
open MyRat

/- `|-x| = |x|`. Use `neg_mk`, `abs_mk`, `mk_eq`, and the integer fact
`Int.natAbs_neg : (-a).natAbs = a.natAbs`. -/
theorem MyRat.abs_neg (x : MyRat) : |(-x)| = |x| := by
  sorry

end Analysis
