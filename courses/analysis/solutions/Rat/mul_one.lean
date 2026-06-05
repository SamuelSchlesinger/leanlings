import Rat.one_mul
namespace Analysis
open MyRat
theorem MyRat.mul_one (x : MyRat) : x * 1 = x := by
  induction x using ind with | _ a b hb =>
  rw [one_def, mul_mk, mk_eq]; grind
end Analysis
