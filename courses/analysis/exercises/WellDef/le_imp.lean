import WellDef.lt_imp

namespace Analysis

/- The non-strict order respects `r`. Mirror of `lt_imp` with `≤` in place of `<`:

  • `Int.mul_le_mul_of_nonneg_right : a ≤ b → 0 ≤ c → a * c ≤ b * c`
  • `Int.mul_le_mul_right : 0 < a → (b * a ≤ c * a ↔ b ≤ c)`

(use `Int.le_of_lt` to get `0 ≤ _` from `0 < _`). -/
theorem PreRat.le_imp {a b c d : PreRat} (hac : PreRat.r a c) (hbd : PreRat.r b d)
    (h : PreRat.leAux a b) : PreRat.leAux c d := by
  have hac' : a.num * c.den = c.num * a.den := hac
  have hbd' : b.num * d.den = d.num * b.den := hbd
  unfold PreRat.leAux at *
  sorry

end Analysis
