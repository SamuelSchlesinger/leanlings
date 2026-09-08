import Cauchy.add_isCauchy

namespace Analysis
open MyRat

/- The negation of a Cauchy sequence is Cauchy. No splitting of the tolerance
is needed. -/
theorem neg_isCauchy {f : ℕ → MyRat} (hf : IsCauchy f) :
    IsCauchy (fun n => -f n) := by
  sorry

end Analysis
