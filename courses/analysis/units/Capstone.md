# The represented real is the limit

A rational Cauchy sequence already gives a real by construction. You now
prove that its rational terms, embedded into the reals, converge to that
real. Constructing a candidate and proving convergence are separate steps.

Embedding a rational uses a constant sequence:

```lean
import Real.Defs
open Analysis
example (q : MyRat) : MyReal.ofRat q =
    MyReal.mk (constSeq q) (const_isCauchy q) := by
  rfl
```

The positivity relation asks for a fixed positive rational lower bound
eventually satisfied by a representative. In the convergence proof, split
the requested tolerance into two parts: one bounds the Cauchy error, and
the other leaves the positive margin needed for strict inequality.

Trace the two indices carefully. One selects the embedded term whose
distance is being bounded; the other indexes a representative of the real.
The Cauchy condition controls both once they are beyond its threshold.
