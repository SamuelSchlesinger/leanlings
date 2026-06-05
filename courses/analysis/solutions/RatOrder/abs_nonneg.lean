import RatOrder.mul_pos
namespace Analysis
open MyRat
theorem MyRat.abs_nonneg (x : MyRat) : 0 ≤ |x| := by
  induction x using ind with | _ a b hb =>
  rw [abs_mk, zero_def, le_mk]; omega
end Analysis
