import WellDef.neg_resp

namespace Analysis

/- The order respects `r`. `PreRat.ltAux a b := a.num * b.den < b.num * a.den`.
We show: if `a ≈ c` and `b ≈ d`, then `ltAux a b → ltAux c d` (so `<` is
well defined as a relation on `MyRat`).

Idea: scale the strict inequality `ltAux a b` by the positive product
`c.den * d.den`, rewrite using `hac`/`hbd` into a multiple of `ltAux c d`, then
cancel the positive factor `a.den * b.den`.

  • `Int.mul_lt_mul_of_pos_right : a < b → 0 < c → a * c < b * c`
  • `Int.mul_lt_mul_right : 0 < a → (b * a < c * a ↔ b < c)`  (for the cancel)
  • `grind` proves the two product-rearrangement equalities you'll need. -/
theorem PreRat.lt_imp {a b c d : PreRat} (hac : PreRat.r a c) (hbd : PreRat.r b d)
    (h : PreRat.ltAux a b) : PreRat.ltAux c d := by
  have hac' : a.num * c.den = c.num * a.den := hac
  have hbd' : b.num * d.den = d.num * b.den := hbd
  unfold PreRat.ltAux at *
  sorry

end Analysis
