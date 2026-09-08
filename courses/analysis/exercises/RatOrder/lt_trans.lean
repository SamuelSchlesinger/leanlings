import RatOrder.lt_irrefl

namespace Analysis
open MyRat

/- Transitivity of `<`. After clearing denominators the statement is not
linear, so `omega` alone cannot close it. Scale, chain, and cancel, as in
`lt_imp`. -/
theorem MyRat.lt_trans {x y z : MyRat} (hxy : x < y) (hyz : y < z) : x < z := by
  sorry

end Analysis
