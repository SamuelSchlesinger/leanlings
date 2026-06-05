import Real.add_comm
namespace Analysis
open MyReal
theorem MyReal.add_assoc (x y z : MyReal) : x + y + z = x + (y + z) := by
  induction x using MyReal.ind with | _ f hf =>
  induction y using MyReal.ind with | _ g hg =>
  induction z using MyReal.ind with | _ h hh =>
  rw [add_mk, add_mk, add_mk, add_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.add_assoc _ _ _))
end Analysis
