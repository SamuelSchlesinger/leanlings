# Approximate a sequence of reals by rationals

The earlier capstone concerned rational Cauchy sequences. Completeness now
concerns an arbitrary Cauchy sequence of **reals**. The bridge is to choose
a rational approximation to each term with an error tending to zero.

```lean
import Complete.approx
open Analysis
example (x : Nat → MyReal) : ∃ q : Nat → MyRat, ∀ k,
    |x k - MyReal.ofRat (q k)| < MyReal.ofRat (MyReal.tolSeq k) := by
  classical
  exact ⟨fun k => Classical.choose (MyReal.approx (x k) (MyReal.tolSeq_pos k)),
    fun k => Classical.choose_spec (MyReal.approx (x k) (MyReal.tolSeq_pos k))⟩
```

This is a mathematical choice of approximations; it does not give an
executable numerical approximation algorithm for arbitrary reals.

The unit now separates the proof into four lessons:

1. `approx` finds a rational close to a given real.
2. `approx_isCauchy` proves the rational approximations are Cauchy. Allocate
   one quarter of the target tolerance to each approximation error and half
   to the distance between the original terms.
3. `tendsto_of_approx` transfers a limit from the approximations to the
   original sequence. This time there are only two errors; use half for each.
4. `complete` assembles those results with `cauchy_seq_converges`. No new
   epsilon estimate is needed in this last step.

For each estimate, write down the intermediate points in the triangle
inequality and the common threshold before filling the hole. Then explain
why the first estimate needs the Cauchy hypothesis but the second only needs
a known limit for the approximations.
