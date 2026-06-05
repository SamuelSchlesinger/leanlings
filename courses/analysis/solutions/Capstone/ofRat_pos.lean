import Real.Limit
namespace Analysis
open MyReal
theorem MyReal.ofRat_pos {q : MyRat} (hq : 0 < q) : (0 : MyReal) < ofRat q := by
  rw [lt_def, sub_zero, ofRat_def, isPos_mk]
  exact ⟨q, hq, 0, fun n _ => by simp only [constSeq]; exact MyRat.le_refl q⟩
end Analysis
