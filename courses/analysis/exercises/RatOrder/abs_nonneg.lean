import RatOrder.mul_pos

namespace Analysis
open MyRat

/- Absolute value is nonnegative. Its computation lemma is

  `abs_mk : |mk a b hb| = mk (↑a.natAbs) b hb`

(the numerator becomes `|a|` as an integer). After `abs_mk`, `zero_def`, `le_mk`,
the goal is an integer fact `omega` knows (`natAbs` is never negative). -/
theorem MyRat.abs_nonneg (x : MyRat) : 0 ≤ |x| := by
  sorry

end Analysis
