import Real.Complete

namespace Analysis
open MyReal

/- # Complete world — ℝ is Cauchy-complete

The grand finale: every Cauchy sequence of reals converges. `Real.Complete`
provides the tolerance sequence `tolSeq` and the `ofRat` order lemmas; the
unit notes list them.

First: every real is approximated by a rational to any positive tolerance.
The capstone theorem says where to look for the rational. -/
theorem MyReal.approx (x : MyReal) {ε : MyRat} (hε : 0 < ε) :
    ∃ q : MyRat, |x - ofRat q| < ofRat ε := by
  sorry

end Analysis
