import Real.mul_assoc
namespace Analysis
open MyReal
theorem MyReal.one_mul (x : MyReal) : 1 * x = x := by
  induction x using MyReal.ind with | _ f hf =>
  rw [one_def, mul_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.one_mul _))
end Analysis
