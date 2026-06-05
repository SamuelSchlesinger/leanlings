import Rat.Ops
namespace Analysis
open MyRat
theorem MyRat.add_comm (x y : MyRat) : x + y = y + x := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  rw [add_mk, add_mk, mk_eq]; grind
end Analysis
