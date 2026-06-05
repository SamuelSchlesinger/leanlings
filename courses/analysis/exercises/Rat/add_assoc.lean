import Rat.add_comm

namespace Analysis
open MyRat

/- Associativity of addition. Three rationals now, so three `induction … using
MyRat.ind`. You will need `add_mk` enough times to fully compute both sides
before `mk_eq` and `grind`. -/
theorem MyRat.add_assoc (x y z : MyRat) : x + y + z = x + (y + z) := by
  sorry

end Analysis
