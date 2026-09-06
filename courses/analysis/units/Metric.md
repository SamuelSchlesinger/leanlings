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

The course definitions quantify over positive rational tolerances, embedded
in the real-valued distance. Follow the explicit `ofRat` conversions in
your goal when combining bounds.
