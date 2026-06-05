import Rat.add_comm
namespace Analysis
open MyRat
theorem MyRat.add_assoc (x y z : MyRat) : x + y + z = x + (y + z) := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  induction z using ind with | _ e f hf =>
  rw [add_mk, add_mk, add_mk, add_mk, mk_eq]; grind
end Analysis
