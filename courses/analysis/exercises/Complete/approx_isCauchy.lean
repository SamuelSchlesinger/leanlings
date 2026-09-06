import Complete.approx

namespace Analysis
open MyReal

/- # Transfer the Cauchy condition to rational approximations

Suppose `x` is Cauchy and `q k` approximates `x k` with error below
`tolSeq k`, which tends to zero. Prove that `q` is Cauchy too. This is the
first of the two estimates needed for completeness.

For a target tolerance `ε`, use half of it for the distance between the
original terms. Split the other half between the two approximation errors:
choose `η + η = ε` and `μ + μ = η`. The total is `μ + (η + μ) = ε`.

There are two thresholds: `K0` makes both approximation errors small;
`K1` makes the original terms close. The skeleton takes their maximum
and names the three bounds. Fill in the triangle estimate by traveling
from `ofRat (q m)` through `x m` and `x n` to `ofRat (q n)`.

Use `abs_sub_le` twice, `add_le_add_left` to enlarge the second term, and
`MyReal.add_lt_add` to combine the strict bounds. `abs_sub_comm` reverses
the first approximation error. The `ofRat` rewrites already move the
rational goal into the real numbers, where the three bounds live.
-/
theorem MyReal.approx_isCauchy {x : ℕ → MyReal} {q : ℕ → MyRat}
    (hx : IsCauchySeq x)
    (hqspec : ∀ k, |x k - ofRat (q k)| < ofRat (tolSeq k)) :
    IsCauchy q := by
  intro ε hε
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hε
  obtain ⟨μ, hμ, hμμ⟩ := MyRat.exists_half hη
  obtain ⟨K0, hK0⟩ := tolSeq_lt hμ
  obtain ⟨K1, hK1⟩ := hx η hη
  refine ⟨Nat.max K0 K1, fun m n hm hn => ?_⟩
  have hAm : |x m - ofRat (q m)| < ofRat μ :=
    MyReal.lt_trans (hqspec m) (ofRat_lt (hK0 m (Nat.le_trans (Nat.le_max_left _ _) hm)))
  have hAn : |x n - ofRat (q n)| < ofRat μ :=
    MyReal.lt_trans (hqspec n) (ofRat_lt (hK0 n (Nat.le_trans (Nat.le_max_left _ _) hn)))
  have hB : |x m - x n| < ofRat η :=
    hK1 m n (Nat.le_trans (Nat.le_max_right _ _) hm) (Nat.le_trans (Nat.le_max_right _ _) hn)
  rw [← ofRat_lt_iff, ofRat_abs, ofRat_sub]
  sorry

end Analysis
