import Real.add_assoc
namespace Analysis
open MyReal
theorem MyReal.zero_add (x : MyReal) : 0 + x = x := by
  induction x using MyReal.ind with | _ f hf =>
  rw [zero_def, add_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.zero_add _))
end Analysis
