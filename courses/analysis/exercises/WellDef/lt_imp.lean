import WellDef.neg_resp

namespace Analysis

/- The strict order respects `r`. `PreRat.ltAux a b` says
`a.num * b.den < b.num * a.den`. Show that if `a ≈ c` and `b ≈ d`, then
`ltAux a b` implies `ltAux c d`. With the converse (the same theorem applied
with the roles exchanged), `<` is well defined on `MyRat`.

Clearing denominators in an inequality is not a ring identity: keep track
of which factors are positive, and cancel only those. -/
theorem PreRat.lt_imp {a b c d : PreRat} (hac : PreRat.r a c) (hbd : PreRat.r b d)
    (h : PreRat.ltAux a b) : PreRat.ltAux c d := by
  sorry

end Analysis
