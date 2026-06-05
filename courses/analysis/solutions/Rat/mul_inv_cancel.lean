import Rat.right_distrib
namespace Analysis
open MyRat
theorem MyRat.mul_inv_cancel (x : MyRat) (hx : x ≠ 0) : x * x⁻¹ = 1 := by
  induction x using ind with | _ a b hb =>
  have ha : a ≠ 0 := by
    intro h; apply hx; rw [h, zero_def, mk_eq]; omega
  rw [inv_mk_of_ne hb ha, mul_mk, one_def, mk_eq]
  have sa := Int.sign_mul_natAbs a
  grind
end Analysis
