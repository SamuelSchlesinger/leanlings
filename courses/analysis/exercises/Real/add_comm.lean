import Real.Mul

namespace Analysis
open MyReal

/- # Real world — ℝ as the quotient of Cauchy sequences

`Real.Defs` and `Real.Mul` build `MyReal` and its operations. The unit notes
show the pattern: a real identity reduces to a pointwise rational identity,
where the matching `MyRat` theorem (which you proved) applies.

Commutativity of addition. -/
theorem MyReal.add_comm (x y : MyReal) : x + y = y + x := by
  sorry

end Analysis
