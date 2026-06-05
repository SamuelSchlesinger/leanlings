import Rat.left_distrib
namespace Analysis
open MyRat
theorem MyRat.right_distrib (x y z : MyRat) : (x + y) * z = x * z + y * z := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  induction z using ind with | _ e f hf =>
  rw [add_mk, mul_mk, mul_mk, mul_mk, add_mk, mk_eq]; grind
end Analysis
