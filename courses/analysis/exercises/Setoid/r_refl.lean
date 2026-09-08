import AnalysisLib.Prelude

namespace Analysis

/- # Setoid world — building ℚ, step 1

A rational number will be a fraction `n / d` with `d > 0`, but many fractions
name the same rational: `1/2`, `2/4`, `3/6`, … . Two fractions `a` and `b` are
related, `PreRat.r a b`, when they cross-multiply equal:

    a.num * b.den = b.num * a.den

To build ℚ as the quotient by `r`, we must first show that `r` is an
equivalence relation. This world proves the three laws, starting with
reflexivity. Read the unit notes first (`lake exe leanlings guide`); they
list the tools each world needs. -/
theorem PreRat.r_refl (a : PreRat) : PreRat.r a a := by
  sorry

end Analysis
