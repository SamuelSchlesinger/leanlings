import Metric.tendsto_const
namespace Analysis
open MyReal
theorem Converges.isCauchySeq {X : Type _} [MetricSpace X] {x : ℕ → X} {L : X}
    (h : Converges x L) : IsCauchySeq x := by
  intro ε hε
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hε
  obtain ⟨N, hN⟩ := h η hη
  refine ⟨N, fun m n hm hn => ?_⟩
  calc dist (x m) (x n) ≤ dist (x m) L + dist L (x n) := dist_triangle _ _ _
    _ < MyReal.ofRat η + MyReal.ofRat η :=
        MyReal.add_lt_add (hN m hm) (by rw [dist_comm]; exact hN n hn)
    _ = MyReal.ofRat ε := by rw [← MyReal.ofRat_add, hηη]
end Analysis
