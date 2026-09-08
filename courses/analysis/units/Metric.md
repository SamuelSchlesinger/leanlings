# Separate points from distances

A metric space can have any type of points. Its distance function takes two
points and returns a nonnegative real, with symmetry, separation, and the
triangle inequality. The algebra in a distance estimate happens in the
real numbers even when the points are not numbers.

```lean
import Metric.Defs
open Analysis
example {X : Type} [MetricSpace X] (a b : X) :
    dist a b + 0 = dist b a := by
  rw [MyReal.add_zero, dist_comm]
```

Convergence bounds the distance to one fixed limit. A Cauchy condition
bounds distances between any two sufficiently late terms. A convergent
sequence is Cauchy because you can travel from one term to the other via
the limit and apply the triangle inequality.

    Converges x L := ∀ ε : MyRat, 0 < ε → ∃ N, ∀ n, N ≤ n → dist (x n) L < ofRat ε
    IsCauchySeq x := ∀ ε : MyRat, 0 < ε → ∃ N, ∀ m n, N ≤ m → N ≤ n → dist (x m) (x n) < ofRat ε
    IsComplete X  := ∀ x, IsCauchySeq x → ∃ L, Converges x L

The course definitions quantify over positive rational tolerances, embedded
in the real-valued distance. Follow the explicit `ofRat` conversions in
your goal when combining bounds: two bounds of `ofRat η` add up to
`ofRat η + ofRat η`, and `MyReal.ofRat_add` turns that back into a single
`ofRat`.

## Toolkit

- Axioms of `MetricSpace X`: `dist_nonneg`, `dist_self : dist x x = 0`,
  `dist_eq_zero`, `dist_comm : dist x y = dist y x`, and
  `dist_triangle : dist x z ≤ dist x y + dist y z`
- Real order facts: `MyReal.ofRat_pos : 0 < q → 0 < ofRat q`,
  `MyReal.add_lt_add`, `MyReal.ofRat_add`, `MyReal.lt_trans`,
  `MyReal.lt_of_le_of_lt`; `calc` chains `≤`, `<`, and `=` steps
- `MyRat.exists_half` splits a rational tolerance
