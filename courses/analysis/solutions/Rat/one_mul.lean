import Rat.mul_assoc
namespace Analysis
open MyRat
theorem MyRat.one_mul (x : MyRat) : 1 * x = x := by
  induction x using ind with | _ a b hb =>
  rw [one_def, mul_mk, mk_eq]; grind
end Analysis
