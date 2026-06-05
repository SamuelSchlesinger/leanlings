import Cauchy.const_isCauchy

namespace Analysis
open MyRat

/- The sum of two Cauchy sequences is Cauchy. This is the archetypal ε/2
argument:

  • split the target tolerance with `obtain ⟨δ, hδ, hδδ⟩ := MyRat.exists_half hε`
    (so `0 < δ` and `δ + δ = ε`);
  • get an `Nf` for `f` at tolerance `δ` and an `Ng` for `g` at tolerance `δ`;
  • use `N = Nat.max Nf Ng` (so both apply), with `Nat.le_max_left/right` and
    `Nat.le_trans`;
  • finish with a `calc`, using `MyRat.add_sub_add` to regroup
    `(f m + g m) - (f n + g n) = (f m - f n) + (g m - g n)`, then `abs_add_le`
    and `MyRat.add_lt_add`.

A skeleton sets up the witnesses; complete the estimate. -/
theorem add_isCauchy {f g : ℕ → MyRat} (hf : IsCauchy f) (hg : IsCauchy g) :
    IsCauchy (fun n => f n + g n) := by
  intro ε hε
  obtain ⟨δ, hδ, hδδ⟩ := MyRat.exists_half hε
  obtain ⟨Nf, hNf⟩ := hf δ hδ
  obtain ⟨Ng, hNg⟩ := hg δ hδ
  refine ⟨Nat.max Nf Ng, fun m n hm hn => ?_⟩
  show |(f m + g m) - (f n + g n)| < ε
  sorry

end Analysis
