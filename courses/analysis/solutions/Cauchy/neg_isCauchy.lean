import Cauchy.add_isCauchy
namespace Analysis
open MyRat
theorem neg_isCauchy {f : ℕ → MyRat} (hf : IsCauchy f) :
    IsCauchy (fun n => -f n) := by
  intro ε hε
  obtain ⟨N, hN⟩ := hf ε hε
  refine ⟨N, fun m n hm hn => ?_⟩
  show |(-f m) - (-f n)| < ε
  rw [MyRat.neg_sub_neg, MyRat.abs_sub_comm]
  exact hN m n hm hn
end Analysis
