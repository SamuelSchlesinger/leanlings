import Cauchy.const_isCauchy
namespace Analysis
open MyRat
theorem add_isCauchy {f g : ℕ → MyRat} (hf : IsCauchy f) (hg : IsCauchy g) :
    IsCauchy (fun n => f n + g n) := by
  intro ε hε
  obtain ⟨δ, hδ, hδδ⟩ := MyRat.exists_half hε
  obtain ⟨Nf, hNf⟩ := hf δ hδ
  obtain ⟨Ng, hNg⟩ := hg δ hδ
  refine ⟨Nat.max Nf Ng, fun m n hm hn => ?_⟩
  have hmf : Nf ≤ m := Nat.le_trans (Nat.le_max_left _ _) hm
  have hnf : Nf ≤ n := Nat.le_trans (Nat.le_max_left _ _) hn
  have hmg : Ng ≤ m := Nat.le_trans (Nat.le_max_right _ _) hm
  have hng : Ng ≤ n := Nat.le_trans (Nat.le_max_right _ _) hn
  have t1 := hNf m n hmf hnf
  have t2 := hNg m n hmg hng
  show |(f m + g m) - (f n + g n)| < ε
  calc |(f m + g m) - (f n + g n)|
      = |(f m - f n) + (g m - g n)| := by rw [MyRat.add_sub_add]
    _ ≤ |f m - f n| + |g m - g n| := MyRat.abs_add_le _ _
    _ < δ + δ := MyRat.add_lt_add t1 t2
    _ = ε := hδδ
end Analysis
