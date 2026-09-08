import RatOrder.abs_neg

namespace Analysis
open MyRat

/- `|x * y| = |x| * |y|`. The integer fact you need is stated in `Nat`; move
it across the cast. -/
theorem MyRat.abs_mul (x y : MyRat) : |x * y| = |x| * |y| := by
  sorry

end Analysis
