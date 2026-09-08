import WellDef.lt_imp

namespace Analysis

/- The non-strict order respects `r`. Same argument as `lt_imp`, with `≤` in
place of `<`. -/
theorem PreRat.le_imp {a b c d : PreRat} (hac : PreRat.r a c) (hbd : PreRat.r b d)
    (h : PreRat.leAux a b) : PreRat.leAux c d := by
  sorry

end Analysis
