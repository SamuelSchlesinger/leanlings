import Cauchy.equiv_symm
namespace Analysis
open MyRat
theorem equiv_trans {f g h : ℕ → MyRat}
    (hfg : CauchyEquiv f g) (hgh : CauchyEquiv g h) : CauchyEquiv f h := by
  intro ε hε
  obtain ⟨δ, hδ, hδδ⟩ := MyRat.exists_half hε
  obtain ⟨N1, hN1⟩ := hfg δ hδ
  obtain ⟨N2, hN2⟩ := hgh δ hδ
  refine ⟨Nat.max N1 N2, fun n hn => ?_⟩
  have h1 := hN1 n (Nat.le_trans (Nat.le_max_left _ _) hn)
  have h2 := hN2 n (Nat.le_trans (Nat.le_max_right _ _) hn)
  calc |f n - h n|
      ≤ |f n - g n| + |g n - h n| := MyRat.abs_sub_le _ _ _
    _ < δ + δ := MyRat.add_lt_add h1 h2
    _ = ε := hδδ
end Analysis
