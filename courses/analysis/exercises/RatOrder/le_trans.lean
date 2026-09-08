import RatOrder.le_refl

namespace Analysis
open MyRat

/- Transitivity of `≤`. -/
theorem MyRat.le_trans {x y z : MyRat} (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z := by
  sorry

end Analysis
