import Complete.approx

namespace Analysis
open MyReal

/- # Transfer the Cauchy condition to rational approximations

Suppose `x` is Cauchy and `q k` approximates `x k` with error below
`tolSeq k`, which tends to zero. Prove that `q` is Cauchy too. This is the
first of the two estimates needed for completeness.

Three errors separate `q m` from `q n`. The tolerance has to cover all of
them, and each has its own threshold. The estimate itself lives in ℝ, where
the approximation bounds are stated. -/
theorem MyReal.approx_isCauchy {x : ℕ → MyReal} {q : ℕ → MyRat}
    (hx : IsCauchySeq x)
    (hqspec : ∀ k, |x k - ofRat (q k)| < ofRat (tolSeq k)) :
    IsCauchy q := by
  sorry

end Analysis
