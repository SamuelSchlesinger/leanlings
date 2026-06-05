import Real.mul_one
namespace Analysis
open MyReal
theorem MyReal.left_distrib (x y z : MyReal) : x * (y + z) = x * y + x * z := by
  induction x using MyReal.ind with | _ f hf =>
  induction y using MyReal.ind with | _ g hg =>
  induction z using MyReal.ind with | _ h hh =>
  rw [add_mk, mul_mk, mul_mk, mul_mk, add_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.left_distrib _ _ _))
end Analysis
