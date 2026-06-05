import RatOrder.abs_add_le

namespace Analysis
open MyRat

/- The characterization `|x| < y ↔ -y < x ∧ x < y`. This iff is exactly how an
absolute-value bound gets unpacked in ε–δ arguments, so it earns its keep later.

After `simp only [abs_mk, neg_mk, lt_mk, Int.neg_mul]`, split on the sign of the
numerator `a` with `by_cases h : 0 ≤ a`. In each branch rewrite `(a.natAbs : ℤ)`
to `a` (resp. `-a`) — package it as a `have hh : (a.natAbs : ℤ) * d = …`, prove
it with `omega`/`Int.neg_mul`, and `rw [hh]` — then `omega` closes the integer
iff once it knows the sign of `a * d` (`Int.mul_nonneg` / `Int.mul_neg_of_neg_of_pos`). -/
theorem MyRat.abs_lt {x y : MyRat} : |x| < y ↔ -y < x ∧ x < y := by
  sorry

end Analysis
