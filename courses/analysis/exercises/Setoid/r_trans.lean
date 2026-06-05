import Setoid.r_symm

namespace Analysis

/- Transitivity of `r` — the one with real content.

From `a.num * b.den = b.num * a.den` and `b.num * c.den = c.num * b.den` we want
`a.num * c.den = c.num * a.den`. The trick: prove it after multiplying both sides
by the positive denominator `b.den`, then *cancel* `b.den` at the end (it is
nonzero because `b.den > 0`).

  • `Int.eq_of_mul_eq_mul_right : a ≠ 0 → b * a = c * a → b = c` does the cancelling.
  • In between, a `calc` chain rearranges the product and rewrites with `h`/`hbc`;
    `Int.mul_right_comm : a * b * c = a * c * b` reshuffles factors.

A skeleton is provided; fill in the cancellation argument. -/
theorem PreRat.r_trans {a b c : PreRat} (hab : PreRat.r a b) (hbc : PreRat.r b c) :
    PreRat.r a c := by
  unfold PreRat.r at *
  -- It suffices to prove the goal multiplied through by `b.den` (which is ≠ 0):
  apply Int.eq_of_mul_eq_mul_right (a := b.den) (by have := b.den_pos; omega)
  -- Goal is now `a.num * c.den * b.den = c.num * a.den * b.den`.
  -- Rearrange and use `hab`, `hbc` (a `calc` with `Int.mul_right_comm` works).
  sorry

end Analysis
