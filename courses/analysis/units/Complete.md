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

The final exercise has two proof obligations. First show the rational
approximations are Cauchy, splitting the error into approximation, original
sequence, and approximation again. Then use their represented real as the
limit and show the original sequence converges to it. Write a tolerance
allocation and a common threshold for each obligation before filling the
two holes.
