import RatOrder.lt_trichotomy
namespace Analysis
open MyRat
theorem MyRat.le_refl (x : MyRat) : x ≤ x := by
  induction x using ind with | _ a b hb =>
  rw [le_mk]; omega
end Analysis
