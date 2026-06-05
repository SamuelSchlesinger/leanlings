import Rat.neg_neg
namespace Analysis
open MyRat
theorem MyRat.mul_comm (x y : MyRat) : x * y = y * x := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  rw [mul_mk, mul_mk, mk_eq]; grind
end Analysis
