import Real.zero_add

namespace Analysis
open MyReal

/- `x + 0 = x`. Use `MyReal.add_comm` and `MyReal.zero_add` directly.
You have already transported those laws from rational representatives to
reals; use them now without reopening the quotient. -/
theorem MyReal.add_zero (x : MyReal) : x + 0 = x := by
  sorry

end Analysis
