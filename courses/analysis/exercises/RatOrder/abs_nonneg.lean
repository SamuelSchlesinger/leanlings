import RatOrder.mul_pos

namespace Analysis
open MyRat

/- Absolute value is nonnegative. Its computation lemma `abs_mk` is in the
unit notes; the numerator becomes `|a|`, cast from `Nat` to `Int`. -/
theorem MyRat.abs_nonneg (x : MyRat) : 0 ≤ |x| := by
  sorry

end Analysis
