import RatOrder.abs_mul

namespace Analysis
open MyRat

/- The triangle inequality `|x + y| ≤ |x| + |y|` — a cornerstone of everything
that follows (it is what makes the metric work).

After reducing with `add_mk`, `abs_mk`, `le_mk`, the goal is a scaled integer
inequality. The heart is the integer triangle inequality

  `Int.natAbs_add_le : (p + q).natAbs ≤ p.natAbs + q.natAbs`

applied to `p = a*d`, `q = c*b`, combined with `Int.natAbs_mul` and the fact that
`(b.natAbs : ℤ) = b`, `(d.natAbs : ℤ) = d` (since `b, d > 0`). Prove the
un-scaled inequality `key` first, then scale it by `b * d ≥ 0` with
`Int.mul_le_mul_of_nonneg_right`.

A skeleton with the right intermediate goal is provided. -/
theorem MyRat.abs_add_le (x y : MyRat) : |x + y| ≤ |x| + |y| := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  rw [add_mk, abs_mk, abs_mk, abs_mk, add_mk, le_mk]
  have key : ((a * d + c * b).natAbs : Int) ≤ (a.natAbs : Int) * d + (c.natAbs : Int) * b := by
    sorry
  exact Int.mul_le_mul_of_nonneg_right key (Int.le_of_lt (Int.mul_pos hb hd))

end Analysis
