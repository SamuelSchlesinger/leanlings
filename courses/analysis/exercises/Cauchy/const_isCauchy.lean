import Cauchy.Defs

namespace Analysis
open MyRat

/- # Cauchy world — sequences of rationals that settle down

`Cauchy.Defs` defines `IsCauchy`, `CauchyEquiv`, and `constSeq`, and provides
a toolkit of rational estimates. The unit notes list them and show the shape
of an ε–N proof.

Warm-up: a constant sequence is Cauchy. -/
theorem const_isCauchy (q : MyRat) : IsCauchy (constSeq q) := by
  sorry

end Analysis
