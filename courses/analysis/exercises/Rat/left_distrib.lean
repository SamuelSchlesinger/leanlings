import Rat.mul_zero

namespace Analysis
open MyRat

/- Left distributivity `x * (y + z) = x * y + x * z`. You will need both `add_mk`
and `mul_mk` (compute the inside sum first, then the products). After `mk_eq`,
`grind` handles the resulting polynomial identity. -/
theorem MyRat.left_distrib (x y z : MyRat) : x * (y + z) = x * y + x * z := by
  sorry

end Analysis
