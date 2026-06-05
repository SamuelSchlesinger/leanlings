import Real.Mul
namespace Analysis
open MyReal
theorem MyReal.add_comm (x y : MyReal) : x + y = y + x := by
  induction x using MyReal.ind with | _ f hf =>
  induction y using MyReal.ind with | _ g hg =>
  rw [add_mk, add_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.add_comm _ _))
end Analysis
