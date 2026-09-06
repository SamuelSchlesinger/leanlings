import Complete.tendsto_of_approx

namespace Analysis
open MyReal

theorem MyReal.complete : IsComplete MyReal := by
  intro x hx
  let q : ℕ → MyRat := fun k => Classical.choose (MyReal.approx (x k) (tolSeq_pos k))
  have hqspec : ∀ k, |x k - ofRat (q k)| < ofRat (tolSeq k) :=
    fun k => Classical.choose_spec (MyReal.approx (x k) (tolSeq_pos k))
  have hqcauchy : IsCauchy q := approx_isCauchy hx hqspec
  exact ⟨mk q hqcauchy, tendsto_of_approx hqspec (cauchy_seq_converges q hqcauchy)⟩

end Analysis
