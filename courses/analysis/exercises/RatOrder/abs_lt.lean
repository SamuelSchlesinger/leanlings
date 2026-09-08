import RatOrder.abs_add_le

namespace Analysis
open MyRat

/- The characterization `|x| < y ↔ -y < x ∧ x < y`. This is how an
absolute-value bound gets unpacked in ε–δ arguments, so it earns its keep
later. The absolute value of the numerator depends on its sign, so treat
the two signs separately. -/
theorem MyRat.abs_lt {x y : MyRat} : |x| < y ↔ -y < x ∧ x < y := by
  sorry

end Analysis
