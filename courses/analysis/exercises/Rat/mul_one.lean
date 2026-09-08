import Rat.one_mul

namespace Analysis
open MyRat

/- `x * 1 = x`. Use the earlier multiplication laws directly:
commutativity turns this into `MyRat.one_mul`. Compare this proof with the
same strategy for `add_zero`; neither needs representatives. -/
theorem MyRat.mul_one (x : MyRat) : x * 1 = x := by
  sorry

end Analysis
