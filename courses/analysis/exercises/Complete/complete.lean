import Complete.approx

namespace Analysis
open MyReal

/- The completeness theorem — every Cauchy sequence of reals converges. The
strategy is rational approximation:

  1. For each `k`, choose a rational `q k` with
     `|x k - ofRat (q k)| < ofRat (tolSeq k)` (`approx` + `Classical.choose`).
  2. Show `q` is a Cauchy sequence of rationals: `|q m - q n|` is small because
     `|ofRat(q m) - ofRat(q n)| ≤ |ofRat(q m) - x m| + |x m - x n| + |x n - ofRat(q n)|`,
     with the outer terms bounded by `tolSeq` and the middle by `hx`. Move between
     ℚ and ℝ with `ofRat_lt_iff`, `ofRat_abs`, `ofRat_sub`, and split the tolerance
     with `MyRat.exists_half` (twice, for the three pieces).
  3. The limit is `mk q hqcauchy`; `x k → it` because `|x k - ofRat (q k)| → 0` and
     `ofRat (q k) → mk q hqcauchy` (`cauchy_seq_converges`).

The skeleton builds the approximating sequence; fill in the two ε–N arguments.
(`MyReal.add_lt_add`, `MyReal.lt_trans`, `add_le_add_left`, and `abs_sub_le` are
the ℝ-order tools; `dist (x m) (x n)` is definitionally `|x m - x n|`.) -/
theorem MyReal.complete : IsComplete MyReal := by
  intro x hx
  let q : ℕ → MyRat := fun k => Classical.choose (MyReal.approx (x k) (tolSeq_pos k))
  have hqspec : ∀ k, |x k - ofRat (q k)| < ofRat (tolSeq k) :=
    fun k => Classical.choose_spec (MyReal.approx (x k) (tolSeq_pos k))
  have hqcauchy : IsCauchy q := by
    sorry
  refine ⟨mk q hqcauchy, ?_⟩
  sorry

end Analysis
