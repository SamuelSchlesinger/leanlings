# Keep track of signs when clearing denominators

Since denominators are positive, comparison of fractions agrees with
comparison after cross-multiplication.

```lean
import Rat.Ops
open Analysis
example : MyRat.mk 1 2 (by decide) < MyRat.mk 3 4 (by decide) := by
  rw [MyRat.lt_mk]
  decide
```

For variable fractions, `omega` handles linear integer consequences. It
does not by itself justify scaling an inequality by an unknown positive
denominator. Supply a multiplication inequality lemma with a positivity
proof, and use `grind` for the polynomial rearrangements. Transitivity and
the compatibility of order with addition are not linear after clearing
denominators; they need the same scale-and-cancel argument as the
well-definedness proofs.

Absolute value also introduces a type boundary: `a.natAbs` has type `Nat`,
even when `a` has type `Int`. Writing `(a.natAbs : Int)` embeds that natural
number into the integers; Lean may display the cast with `↑`.

```lean
import AnalysisLib.Prelude
example (m n : Nat) (h : m ≤ n) : (m : Int) ≤ (n : Int) := by
  exact_mod_cast h

example (m n : Nat) : ((m * n : Nat) : Int) = (m : Int) * (n : Int) := by
  push_cast
  rfl
```

`exact_mod_cast h` transports evidence across these casts. `push_cast`
rewrites a cast of a sum or product as a sum or product of casts; it does
not prove the underlying inequality. In the triangle-inequality exercise,
first obtain the integer absolute-value bound, then scale it.

`omega` understands `natAbs`: from `0 ≤ a` it knows `(a.natAbs : Int) = a`,
and from `a < 0` it knows `(a.natAbs : Int) = -a`. When the sign of a
numerator is unknown, split on it with `by_cases h : 0 ≤ a`.

Absolute value turns signed differences into distances. The triangle
inequality bounds a combined error by the sum of its parts; it will be the
main tool in the Cauchy unit. Density and the Archimedean property provide
small tolerances and sufficiently large bounds. Give the witnesses in words
before constructing them in Lean; a rational witness is built with
`MyRat.mk` from an integer numerator, an integer denominator, and a proof
that the denominator is positive.

## Toolkit

Order computation lemmas, in the `MyRat` namespace:

- `lt_mk : mk a b hb < mk c d hd ↔ a * d < c * b`
- `le_mk : mk a b hb ≤ mk c d hd ↔ a * d ≤ c * b`
- `abs_mk`: the absolute value of `mk a b hb` is `mk (a.natAbs : Int) b hb`

Integer facts:

- `Int.mul_lt_mul_of_pos_right : a < b → 0 < c → a * c < b * c`
- `Int.mul_le_mul_of_nonneg_right : a ≤ b → 0 ≤ c → a * c ≤ b * c`
- `Int.mul_le_mul_of_nonneg_left : a ≤ b → 0 ≤ c → c * a ≤ c * b`
- `Int.mul_lt_mul_right : 0 < a → (b * a < c * a ↔ b < c)`
- `Int.mul_le_mul_right : 0 < a → (b * a ≤ c * a ↔ b ≤ c)`
- `Int.mul_pos`, `Int.mul_nonneg`: products of positives, of nonnegatives
- `Int.mul_neg_of_neg_of_pos : a < 0 → 0 < b → a * b < 0`
- `Int.lt_trans`, `Int.le_trans`, `Int.le_of_lt`
- `Int.natAbs_mul : (a * b).natAbs = a.natAbs * b.natAbs`
- `Int.natAbs_neg : (-a).natAbs = a.natAbs`
- `Int.natAbs_add_le : (a + b).natAbs ≤ a.natAbs + b.natAbs`, stated in `Nat`
- `Int.neg_mul : -a * b = -(a * b)`
