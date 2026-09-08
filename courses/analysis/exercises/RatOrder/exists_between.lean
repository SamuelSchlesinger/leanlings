import RatOrder.archimedean

namespace Analysis
open MyRat

/- Density of ℚ: between any `x < y` lies another rational. Choose a witness,
built with `mk` from its numerator, denominator, and positivity proof, then
prove both strict inequalities by scaling the hypothesis. -/
theorem MyRat.exists_between {x y : MyRat} (h : x < y) : ∃ z : MyRat, x < z ∧ z < y := by
  sorry

end Analysis
