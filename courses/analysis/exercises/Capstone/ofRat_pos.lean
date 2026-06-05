import Real.Limit

namespace Analysis
open MyReal

/- # Capstone — ℝ is complete over ℚ

You have ℝ as an ordered ring with `|·|`. The order is defined through positivity:
`0 < x` unfolds (via `lt_def`) to `IsPos (x - 0)`, and `IsPos (mk g hg)`
(`isPos_mk`) means `g` is eventually bounded below by a fixed *positive* rational.

Warm-up: a positive rational embeds to a positive real. For the constant
sequence `ofRat q`, the eventual lower bound is `q` itself.

  rw [lt_def, sub_zero, ofRat_def, isPos_mk]
  exact ⟨q, hq, 0, fun n _ => by simp only [constSeq]; exact MyRat.le_refl q⟩
-/
theorem MyReal.ofRat_pos {q : MyRat} (hq : 0 < q) : (0 : MyReal) < ofRat q := by
  sorry

end Analysis
