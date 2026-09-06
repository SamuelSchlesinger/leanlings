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
proof, and use `grind` for the polynomial rearrangements.

Absolute value turns signed differences into distances. The triangle
inequality bounds a combined error by the sum of its parts; it will be the
main tool in the Cauchy unit. Density and the Archimedean property provide
small tolerances and sufficiently large bounds. Give the witnesses in words
before constructing them in Lean.
