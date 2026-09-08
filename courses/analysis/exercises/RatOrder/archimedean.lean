import RatOrder.abs_lt

namespace Analysis
open MyRat

/- The Archimedean property: no rational is an upper bound for ℕ. Every `x`
is below some natural number `n`, embedded as `ofInt n`. Choose the witness
from the numerator, and remember that the denominator is at least `1`. -/
theorem MyRat.archimedean (x : MyRat) : ∃ n : ℕ, x < ofInt (n : Int) := by
  sorry

end Analysis
