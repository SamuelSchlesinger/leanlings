import Rat.mul_inv_cancel

namespace Analysis
open MyRat

/- # RatOrder world — order, absolute value, and the Archimedean property

The order on `MyRat` has its own computation lemmas:

  • `lt_mk : (mk a b hb < mk c d hd) ↔ a * d < c * b`
  • `le_mk : (mk a b hb ≤ mk c d hd) ↔ a * d ≤ c * b`

so an order goal on rationals becomes one on integers, closed by `omega`
(linear) or the `grind`/scaling techniques below.

Warm-up: `<` is irreflexive. After `lt_mk`, it's an integer fact for `omega`. -/
theorem MyRat.lt_irrefl (x : MyRat) : ¬ x < x := by
  sorry

end Analysis
