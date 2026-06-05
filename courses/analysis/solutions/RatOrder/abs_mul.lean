import RatOrder.abs_neg
namespace Analysis
open MyRat
theorem MyRat.abs_mul (x y : MyRat) : |x * y| = |x| * |y| := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  rw [mul_mk, abs_mk, abs_mk, abs_mk, mul_mk, mk_eq, Int.natAbs_mul]
  push_cast; grind
end Analysis
