import Real.Complete

namespace Analysis
open MyReal

/- # Complete world — ℝ is Cauchy-complete

The grand finale: every Cauchy sequence of *reals* converges. `Real.Complete`
provides the tools — the tolerance sequence `tolSeq k = 1/(k+1)` with `tolSeq_pos`
and `tolSeq_lt` (it tends to `0`), and the `ofRat` order/absolute-value
homomorphism (`ofRat_lt`, `ofRat_lt_iff`, `ofRat_abs`, `ofRat_sub`, `ofRat_add`).

First, this lemma: every real is approximated by a rational to any positive
tolerance. For `x = mk f hf`, the rational `f N` works for large `N` — because
`cauchy_seq_converges` says `ofRat (f k) → x`. Use `MyReal.abs_sub_comm` to flip
`|mk f hf - ofRat (f N)|` into the form `cauchy_seq_converges` gives you. -/
theorem MyReal.approx (x : MyReal) {ε : MyRat} (hε : 0 < ε) :
    ∃ q : MyRat, |x - ofRat q| < ofRat ε := by
  sorry

end Analysis
