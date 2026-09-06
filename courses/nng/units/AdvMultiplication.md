# Track the nonzero assumption

Multiplication by zero loses information: `0 * b = 0 * c` tells you nothing
about `b` and `c`. Cancellation therefore requires a nonzero factor.

```lean
import LessOrEqual.le_two
open MyNat
example (a b : ℕ) (h : a * b ≠ 0) (hb : b = 0) : False := by
  apply h
  rewrite [hb, mul_zero]
  rfl
```

This pattern turns a negated equality into a useful contradiction. A
nonzero natural is a successor, so case analysis can also turn a nonzero
assumption into constructor information.

The hardest cancellation exercise needs a stronger induction hypothesis:
prove the statement for every possible value of the other factor.
`generalizing c` lets the successor branch apply that hypothesis to a new
value of `c`. The exercise explains why fixing `c` too early is insufficient.
