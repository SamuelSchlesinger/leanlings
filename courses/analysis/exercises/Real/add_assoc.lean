import Real.add_comm

namespace Analysis
open MyReal

/- Associativity of `+` on ℝ. Three `MyReal.ind`, enough `add_mk`s to compute, then
the pointwise fact is `MyRat.add_assoc`. -/
theorem MyReal.add_assoc (x y z : MyReal) : x + y + z = x + (y + z) := by
  sorry

end Analysis
