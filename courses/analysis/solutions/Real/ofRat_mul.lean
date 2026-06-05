import Real.ofRat_add
namespace Analysis
open MyReal
theorem MyReal.ofRat_mul (a b : MyRat) : ofRat (a * b) = ofRat a * ofRat b := by
  rw [ofRat_def, ofRat_def, ofRat_def, mul_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => rfl))
end Analysis
