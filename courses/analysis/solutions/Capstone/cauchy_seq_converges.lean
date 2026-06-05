import Capstone.ofRat_pos
namespace Analysis
open MyReal
theorem MyReal.cauchy_seq_converges (f : ℕ → MyRat) (hf : IsCauchy f) :
    Tendsto (fun k => ofRat (f k)) (mk f hf) := by
  intro ε hε
  obtain ⟨δ, hδ, hδδ⟩ := MyRat.exists_half hε
  obtain ⟨N, hN⟩ := hf δ hδ
  refine ⟨N, fun k hk => ?_⟩
  show IsPos (ofRat ε - |ofRat (f k) - mk f hf|)
  rw [ofRat_def, ofRat_def, sub_mk, abs_mk, sub_mk, isPos_mk]
  refine ⟨δ, hδ, N, fun n hn => ?_⟩
  simp only [constSeq]
  rw [← MyRat.sub_eq]
  have hb : |f k - f n| ≤ δ := MyRat.le_of_lt (hN k n hk hn)
  rw [MyRat.le_sub_iff, ← hδδ]
  exact MyRat.add_le_add_left δ hb
end Analysis
