import Real.neg_add_cancel
namespace Analysis
open MyReal
theorem MyReal.mul_comm (x y : MyReal) : x * y = y * x := by
  induction x using MyReal.ind with | _ f hf =>
  induction y using MyReal.ind with | _ g hg =>
  rw [mul_mk, mul_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.mul_comm _ _))
end Analysis
