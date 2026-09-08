import Rat.left_distrib

namespace Analysis
open MyRat

/- Right distributivity `(x + y) * z = x * z + y * z` follows from the left
law and commutativity. When the same law could rewrite several products,
give it explicit arguments so it selects the one you intend. -/
theorem MyRat.right_distrib (x y z : MyRat) : (x + y) * z = x * z + y * z := by
  sorry

end Analysis
