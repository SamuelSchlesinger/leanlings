import Real.mul_comm
namespace Analysis
open MyReal
theorem MyReal.mul_assoc (x y z : MyReal) : x * y * z = x * (y * z) := by
  induction x using MyReal.ind with | _ f hf =>
  induction y using MyReal.ind with | _ g hg =>
  induction z using MyReal.ind with | _ h hh =>
  rw [mul_mk, mul_mk, mul_mk, mul_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.mul_assoc _ _ _))
end Analysis
