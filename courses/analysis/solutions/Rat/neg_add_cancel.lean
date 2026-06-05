import Rat.add_zero
namespace Analysis
open MyRat
theorem MyRat.neg_add_cancel (x : MyRat) : -x + x = 0 := by
  induction x using ind with | _ a b hb =>
  rw [neg_mk, add_mk, zero_def, mk_eq]; grind
end Analysis
