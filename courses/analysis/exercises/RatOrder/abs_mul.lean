import RatOrder.abs_neg

namespace Analysis
open MyRat

/- `|x * y| = |x| * |y|`. After the computation lemmas and `mk_eq`, you'll need
`Int.natAbs_mul : (a*c).natAbs = a.natAbs * c.natAbs`, then `push_cast` to move
the `ℕ`-to-`ℤ` cast across the product, and `grind` to finish. -/
theorem MyRat.abs_mul (x y : MyRat) : |x * y| = |x| * |y| := by
  sorry

end Analysis
