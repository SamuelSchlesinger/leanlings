import Real.mul_comm

namespace Analysis
open MyReal

/- Associativity of `×`. Like `add_assoc`, with `mul_mk` and `MyRat.mul_assoc`. -/
theorem MyReal.mul_assoc (x y z : MyReal) : x * y * z = x * (y * z) := by
  sorry

end Analysis
