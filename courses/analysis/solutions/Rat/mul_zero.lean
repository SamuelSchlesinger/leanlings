import Rat.mul_one
namespace Analysis
open MyRat
theorem MyRat.mul_zero (x : MyRat) : x * 0 = 0 := by
  induction x using ind with | _ a b hb =>
  rw [zero_def, mul_mk, mk_eq]; grind
end Analysis
