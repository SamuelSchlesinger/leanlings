import Metric.Defs
namespace Analysis
open MyReal
theorem Converges.const {X : Type _} [MetricSpace X] (a : X) : Converges (fun _ => a) a := by
  intro ε hε
  refine ⟨0, fun n _ => ?_⟩
  rw [dist_self]
  exact MyReal.ofRat_pos hε
end Analysis
