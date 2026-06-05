import Capstone.ofRat_pos

namespace Analysis
open MyReal

/- The completeness theorem: a Cauchy sequence of rationals `f` converges, in ℝ,
to the real `mk f hf` it represents — the sense in which ℝ completes ℚ.

The target `|ofRat (f k) - mk f hf| < ofRat ε` unfolds to `IsPos (ofRat ε - |…|)`;
after the computation lemmas you must exhibit a positive rational eventually below
`ε - |f k - f n|`.

Strategy: split `ε = δ + δ` (`exists_half`), get `N` from `f` Cauchy at tolerance
`δ`, and use `δ` as the witness — because for `k, n ≥ N`, `|f k - f n| ≤ δ`
(`le_of_lt (hN …)`), so `δ ≤ ε - |f k - f n|` follows by transposing with
`MyRat.le_sub_iff` and `← hδδ`, then `MyRat.add_le_add_left`.

The skeleton does the unfolding; finish the estimate. -/
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
  sorry

end Analysis
