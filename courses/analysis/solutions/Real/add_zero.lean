import Real.zero_add
namespace Analysis
open MyReal
theorem MyReal.add_zero (x : MyReal) : x + 0 = x := by
  induction x using MyReal.ind with | _ f hf =>
  rw [zero_def, add_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.add_zero _))
end Analysis
