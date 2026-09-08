import Metric.tendsto_const

namespace Analysis
open MyReal

/- A convergent sequence is Cauchy: the first real theorem of metric-space
analysis, and a model ε/2 argument. Travel between two late terms through
the limit. -/
theorem Converges.isCauchySeq {X : Type _} [MetricSpace X] {x : ℕ → X} {L : X}
    (h : Converges x L) : IsCauchySeq x := by
  sorry

end Analysis
