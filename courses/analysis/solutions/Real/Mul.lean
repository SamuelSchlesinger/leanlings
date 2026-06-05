/-
Infrastructure (given): multiplication on `MyReal`. We multiply representatives
pointwise (Cauchy by `mul_isCauchy`) and check the product respects `CauchyEquiv`
(`mul_equiv`) — the same bounded ε/2 estimate as `mul_isCauchy`, now comparing
`f·g` with `f'·g'`.
-/
import Real.Defs

namespace Analysis
open MyRat

namespace CauSeq

def mul (f g : CauSeq) : CauSeq :=
  ⟨fun n => f.seq n * g.seq n, mul_isCauchy f.is_cauchy g.is_cauchy⟩

theorem mul_equiv {f f' g g' : CauSeq} (hf : f ≈ f') (hg : g ≈ g') : mul f g ≈ mul f' g' := by
  have hf' : CauchyEquiv f.seq f'.seq := hf
  have hg' : CauchyEquiv g.seq g'.seq := hg
  obtain ⟨Cg, hCg⟩ := cauchy_bounded g.is_cauchy
  obtain ⟨Cf, hCf⟩ := cauchy_bounded f'.is_cauchy
  have hC0 : (0 : MyRat) ≤ MyRat.max Cg Cf :=
    MyRat.le_trans (MyRat.abs_nonneg (g.seq 0)) (MyRat.le_trans (hCg 0) (MyRat.le_max_left _ _))
  have hCpos : 0 < MyRat.max Cg Cf + 1 :=
    MyRat.lt_of_le_of_lt hC0 (by
      have h := MyRat.add_lt_add_left (MyRat.max Cg Cf) MyRat.zero_lt_one
      rwa [MyRat.add_zero] at h)
  have hgC : ∀ n, |g.seq n| ≤ MyRat.max Cg Cf + 1 := fun n =>
    MyRat.le_trans (hCg n) (MyRat.le_trans (MyRat.le_max_left _ _) (MyRat.le_add_one _))
  have hfC : ∀ n, |f'.seq n| ≤ MyRat.max Cg Cf + 1 := fun n =>
    MyRat.le_trans (hCf n) (MyRat.le_trans (MyRat.le_max_right _ _) (MyRat.le_add_one _))
  intro ε hε
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hε
  obtain ⟨δ, hδ, hδC⟩ := exists_lt_div hη hCpos
  obtain ⟨N1, hN1⟩ := hf' δ hδ
  obtain ⟨N2, hN2⟩ := hg' δ hδ
  refine ⟨Nat.max N1 N2, fun n hn => ?_⟩
  have t1 := hN1 n (Nat.le_trans (Nat.le_max_left _ _) hn)
  have t2 := hN2 n (Nat.le_trans (Nat.le_max_right _ _) hn)
  show |f.seq n * g.seq n - f'.seq n * g'.seq n| < ε
  have term1 : |f.seq n - f'.seq n| * |g.seq n| < η := by
    calc |f.seq n - f'.seq n| * |g.seq n|
        ≤ |f.seq n - f'.seq n| * (MyRat.max Cg Cf + 1) :=
          MyRat.mul_le_mul_of_nonneg_left (hgC n) (MyRat.abs_nonneg _)
      _ < δ * (MyRat.max Cg Cf + 1) := MyRat.mul_lt_mul_of_pos_right t1 hCpos
      _ = (MyRat.max Cg Cf + 1) * δ := MyRat.mul_comm _ _
      _ < η := hδC
  have term2 : |f'.seq n| * |g.seq n - g'.seq n| < η := by
    calc |f'.seq n| * |g.seq n - g'.seq n|
        ≤ (MyRat.max Cg Cf + 1) * |g.seq n - g'.seq n| :=
          MyRat.mul_le_mul_of_nonneg_right (hfC n) (MyRat.abs_nonneg _)
      _ < (MyRat.max Cg Cf + 1) * δ := MyRat.mul_lt_mul_of_pos_left t2 hCpos
      _ < η := hδC
  calc |f.seq n * g.seq n - f'.seq n * g'.seq n|
      = |(f.seq n - f'.seq n) * g.seq n + f'.seq n * (g.seq n - g'.seq n)| := by
        rw [MyRat.mul_sub_mul]
    _ ≤ |(f.seq n - f'.seq n) * g.seq n| + |f'.seq n * (g.seq n - g'.seq n)| := MyRat.abs_add_le _ _
    _ = |f.seq n - f'.seq n| * |g.seq n| + |f'.seq n| * |g.seq n - g'.seq n| := by
        rw [MyRat.abs_mul, MyRat.abs_mul]
    _ < η + η := MyRat.add_lt_add term1 term2
    _ = ε := hηη

end CauSeq

namespace MyReal

instance : Mul MyReal :=
  ⟨Quotient.lift₂ (fun f g => Quotient.mk _ (CauSeq.mul f g))
    (fun _ _ _ _ h1 h2 => Quotient.sound (CauSeq.mul_equiv h1 h2))⟩

theorem mul_mk (f g : ℕ → MyRat) (hf : IsCauchy f) (hg : IsCauchy g) :
    mk f hf * mk g hg = mk (fun n => f n * g n) (mul_isCauchy hf hg) := rfl

end MyReal
end Analysis
