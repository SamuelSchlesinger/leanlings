import Complete.approx_isCauchy

namespace Analysis
open MyReal

/- # Transfer a limit back to the original sequence

Suppose the rational approximations, embedded in the reals, converge to
`L`. Show that `x` converges to the same `L`. This step only needs the
approximation bounds and the known limit; it does not use a Cauchy
hypothesis on `x`.

Compare this two-piece estimate with the three-piece one in the preceding
lesson, and explain why the number of errors changes. -/
theorem MyReal.tendsto_of_approx {x : ℕ → MyReal} {q : ℕ → MyRat} {L : MyReal}
    (hqspec : ∀ k, |x k - ofRat (q k)| < ofRat (tolSeq k))
    (hq : Tendsto (fun k => ofRat (q k)) L) : Converges x L := by
  sorry

end Analysis
