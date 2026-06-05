import RatOrder.le_refl

namespace Analysis
open MyRat

/- Transitivity of `≤`. The same scale-and-cancel argument as `lt_trans`, but
with the `≤` lemmas: `Int.mul_le_mul_of_nonneg_right`, `Int.le_trans`,
`Int.mul_le_mul_right`. -/
theorem MyRat.le_trans {x y z : MyRat} (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z := by
  sorry

end Analysis
