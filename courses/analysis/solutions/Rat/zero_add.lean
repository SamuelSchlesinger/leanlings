import Rat.add_assoc
namespace Analysis
open MyRat
theorem MyRat.zero_add (x : MyRat) : 0 + x = x := by
  induction x using ind with | _ a b hb =>
  rw [zero_def, add_mk, mk_eq]; grind
end Analysis
