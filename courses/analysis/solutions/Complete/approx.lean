import Real.Complete
namespace Analysis
open MyReal
theorem MyReal.approx (x : MyReal) {ε : MyRat} (hε : 0 < ε) :
    ∃ q : MyRat, |x - ofRat q| < ofRat ε := by
  induction x using MyReal.ind with | _ f hf =>
  obtain ⟨N, hN⟩ := cauchy_seq_converges f hf ε hε
  refine ⟨f N, ?_⟩
  rw [MyReal.abs_sub_comm]
  exact hN N (Nat.le_refl N)
end Analysis
