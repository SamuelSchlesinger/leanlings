import Rat.zero_add
namespace Analysis
open MyRat
theorem MyRat.add_zero (x : MyRat) : x + 0 = x := by
  induction x using ind with | _ a b hb =>
  rw [zero_def, add_mk, mk_eq]; grind
end Analysis
