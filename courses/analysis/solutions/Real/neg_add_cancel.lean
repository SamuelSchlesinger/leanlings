import Real.add_zero
namespace Analysis
open MyReal
theorem MyReal.neg_add_cancel (x : MyReal) : -x + x = 0 := by
  induction x using MyReal.ind with | _ f hf =>
  rw [neg_mk, add_mk, zero_def]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.neg_add_cancel _))
end Analysis
