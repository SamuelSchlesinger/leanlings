import Rat.zero_add

namespace Analysis
open MyRat

/- `x + 0 = x`. You already know commutativity and the left identity law.
Commute the sum and apply `MyRat.zero_add`. This proof can stay at the level
of rational arithmetic; quotient induction would repeat work unnecessarily.
Explain why two earlier laws are enough. -/
theorem MyRat.add_zero (x : MyRat) : x + 0 = x := by
  sorry

end Analysis
