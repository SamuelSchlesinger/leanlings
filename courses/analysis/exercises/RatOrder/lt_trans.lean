import RatOrder.lt_irrefl

namespace Analysis
open MyRat

/- Transitivity of `<`. The integer statement (`a*d < c*b`, `c*f < e*d` ⊢
`a*f < e*b`) is *not* linear, so `omega` alone won't do — we scale and cancel,
just like `PreRat.r_trans` and `PreRat.lt_imp`:

  • scale each hypothesis by a positive denominator with
    `Int.mul_lt_mul_of_pos_right`;
  • rearrange products with `grind`-proved equalities;
  • chain with `Int.lt_trans`, then cancel a positive factor with
    `Int.mul_lt_mul_right`.

Reduce to integers first (`induction … ; rw [lt_mk] at *`), then carry it out. -/
theorem MyRat.lt_trans {x y z : MyRat} (hxy : x < y) (hyz : y < z) : x < z := by
  sorry

end Analysis
