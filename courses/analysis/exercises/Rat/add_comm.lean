import Rat.Ops

namespace Analysis
open MyRat

/- # Rat world — the arithmetic laws of ℚ

`Rat.Ops` gives every operation on `MyRat`. The unit notes show the pattern:
choose representatives, compute the operations with the `_mk` lemmas, turn
the equation of rationals into one of integers, and close it. Read the
integer equation before letting automation check it.

Commutativity of addition. -/
theorem MyRat.add_comm (x y : MyRat) : x + y = y + x := by
  sorry

end Analysis
