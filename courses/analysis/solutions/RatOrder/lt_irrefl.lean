import Rat.mul_inv_cancel
namespace Analysis
open MyRat
theorem MyRat.lt_irrefl (x : MyRat) : ¬ x < x := by
  induction x using ind with | _ a b hb =>
  rw [lt_mk]; omega
end Analysis
