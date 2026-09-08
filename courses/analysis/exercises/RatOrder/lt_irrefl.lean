import Rat.mul_inv_cancel

namespace Analysis
open MyRat

/- # RatOrder world — order, absolute value, and the Archimedean property

The order on `MyRat` has its own computation lemmas, `lt_mk` and `le_mk`,
which turn an order goal on fractions into one on integers. The unit notes
list them, together with the integer facts this world needs.

Warm-up: `<` is irreflexive. -/
theorem MyRat.lt_irrefl (x : MyRat) : ¬ x < x := by
  sorry

end Analysis
