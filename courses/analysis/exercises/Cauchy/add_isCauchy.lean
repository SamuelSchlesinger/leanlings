import Cauchy.const_isCauchy

namespace Analysis
open MyRat

/- The sum of two Cauchy sequences is Cauchy. This is the archetypal ε/2
argument: each summand gets part of the tolerance, and the threshold must
serve both. -/
theorem add_isCauchy {f g : ℕ → MyRat} (hf : IsCauchy f) (hg : IsCauchy g) :
    IsCauchy (fun n => f n + g n) := by
  sorry

end Analysis
