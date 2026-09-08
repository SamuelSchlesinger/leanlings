import Metric.Defs

namespace Analysis
open MyReal

/- # Metric world — abstract metric spaces

`Metric.Defs` gives a `MetricSpace` class, an ℝ-valued `dist` with the usual
axioms, makes ℝ an instance with `dist x y = |x - y|`, and defines
`Converges`, `IsCauchySeq`, and `IsComplete`. These exercises prove the basic
theory generically, from the axioms alone, so they hold in every metric
space. The unit notes list the axioms and the real-number facts you need.

Warm-up: a constant sequence converges to its value. -/
theorem Converges.const {X : Type _} [MetricSpace X] (a : X) : Converges (fun _ => a) a := by
  sorry

end Analysis
