import RatOrder.archimedean

namespace Analysis
open MyRat

/- Density of ℚ: between any `x < y` lies another rational. The classic witness
is the midpoint; with `x = a/b` and `y = c/d` it is `(a*d + c*b) / (2*b*d)`.

Provide that as the witness, then prove both strict inequalities. Each reduces
(after `lt_mk`) to an integer inequality that follows from scaling the hypothesis
`a*d < c*b` by a positive factor (`Int.mul_lt_mul_of_pos_right`) and rearranging
with a couple of `grind`-proved equalities, finishing with `omega`. -/
theorem MyRat.exists_between {x y : MyRat} (h : x < y) : ∃ z : MyRat, x < z ∧ z < y := by
  sorry

end Analysis
