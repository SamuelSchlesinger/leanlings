import Rat.left_distrib

namespace Analysis
open MyRat

/- Right distributivity `(x + y) * z = x * z + y * z` follows from the
left distributive law and commutativity. Commute the outside product, expand
with `MyRat.left_distrib`, then commute each smaller product. Give explicit
arguments to the last rewrites so they select the products you intend. -/
theorem MyRat.right_distrib (x y z : MyRat) : (x + y) * z = x * z + y * z := by
  sorry

end Analysis
