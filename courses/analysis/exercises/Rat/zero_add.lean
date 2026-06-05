import Rat.add_assoc

namespace Analysis
open MyRat

/- `0 + x = x`. Use `zero_def` to expose `0` as `mk 0 1`, then the usual
`add_mk`, `mk_eq`, `grind`. -/
theorem MyRat.zero_add (x : MyRat) : 0 + x = x := by
  sorry

end Analysis
