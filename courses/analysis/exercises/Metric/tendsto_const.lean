import Metric.Defs

namespace Analysis
open MyReal

/- # Metric world — abstract metric spaces

`Metric.Defs` gives a `MetricSpace` class — an ℝ-valued `dist` with the usual
axioms (`dist_nonneg`, `dist_self`, `dist_eq_zero`, `dist_comm`, `dist_triangle`) —
makes ℝ an instance (`dist x y = |x - y|`), and defines `Converges`,
`IsCauchySeq`, and `IsComplete`. These exercises prove the basic theory
*generically*, from the axioms alone, so they hold in every metric space.

Warm-up: a constant sequence converges to its value. Unfold `Converges`, pick any
`N`; the distance is `dist a a = 0` (`dist_self`), and `0 < ofRat ε` is
`MyReal.ofRat_pos hε`. -/
theorem Converges.const {X : Type _} [MetricSpace X] (a : X) : Converges (fun _ => a) a := by
  sorry

end Analysis
