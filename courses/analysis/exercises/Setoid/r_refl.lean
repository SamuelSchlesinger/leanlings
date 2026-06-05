import AnalysisLib.Prelude

namespace Analysis

/- # Setoid world — building ℚ, step 1

A rational number will be a fraction `n / d` (with `d > 0`), but many fractions
name the *same* rational: `1/2`, `2/4`, `3/6`, … . We capture this with a
relation `PreRat.r`: two fractions are related when they cross-multiply equal,

    PreRat.r a b   :=   a.num * b.den = b.num * a.den.

To build ℚ as the quotient by `r`, we must first show `r` is an *equivalence
relation*: reflexive, symmetric, transitive. That is this world.

This first one — reflexivity — is immediate: `PreRat.r a a` unfolds to
`a.num * a.den = a.num * a.den`. -/
theorem PreRat.r_refl (a : PreRat) : PreRat.r a a := by
  sorry

end Analysis
