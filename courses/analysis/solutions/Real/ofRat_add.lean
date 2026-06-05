import Real.left_distrib
namespace Analysis
open MyReal
theorem MyReal.ofRat_add (a b : MyRat) : ofRat (a + b) = ofRat a + ofRat b := by
  rw [ofRat_def, ofRat_def, ofRat_def, add_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => rfl))
end Analysis
