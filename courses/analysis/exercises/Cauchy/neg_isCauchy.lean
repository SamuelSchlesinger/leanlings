import Cauchy.add_isCauchy

namespace Analysis
open MyRat

/- The negation of a Cauchy sequence is Cauchy. No ε-splitting needed: the same
`N` works, because `(-f m) - (-f n) = f n - f m`, whose absolute value equals
`|f m - f n|`. Lemmas: `MyRat.neg_sub_neg`, `MyRat.abs_sub_comm`. -/
theorem neg_isCauchy {f : ℕ → MyRat} (hf : IsCauchy f) :
    IsCauchy (fun n => -f n) := by
  sorry

end Analysis
