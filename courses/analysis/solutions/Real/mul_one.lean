import Real.one_mul
namespace Analysis
open MyReal
theorem MyReal.mul_one (x : MyReal) : x * 1 = x := by
  induction x using MyReal.ind with | _ f hf =>
  rw [one_def, mul_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.mul_one _))
end Analysis
