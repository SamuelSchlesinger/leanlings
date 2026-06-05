/-
Infrastructure (given): the multiplicative inverse on ℝ — the step that makes it
a field. The idea: a real `x ≠ 0` has a representative that is eventually bounded
away from `0` (the apartness lemma), so its termwise reciprocal is Cauchy. The
inverse is `0` on the null sequences and the termwise reciprocal otherwise.

This is the most intricate construction in the course; it is given in full.
-/
import Metric.Defs

namespace Analysis
open MyRat

/-! ### ℚ inverse toolkit -/

theorem MyRat.not_lt {a b : MyRat} : ¬ a < b ↔ b ≤ a := by
  constructor
  · intro h
    rcases MyRat.lt_trichotomy a b with h1 | h1 | h1
    · exact absurd h1 h
    · rw [h1]; exact MyRat.le_refl b
    · exact MyRat.le_of_lt h1
  · intro h hlt
    exact absurd (MyRat.lt_of_lt_of_le hlt h) (MyRat.lt_irrefl a)

theorem MyRat.inv_zero : (0 : MyRat)⁻¹ = 0 := rfl

theorem MyRat.abs_inv (a : MyRat) : |a⁻¹| = |a|⁻¹ := by
  by_cases ha : a = 0
  · subst ha; rw [MyRat.inv_zero, MyRat.abs_zero, MyRat.inv_zero]
  · induction a using ind with | _ p q hq =>
    have hp : p ≠ 0 := by intro h; apply ha; rw [h, zero_def, mk_eq]; omega
    have hnp : (p.natAbs : Int) ≠ 0 := by simp [Int.natAbs_eq_zero, hp]
    rw [inv_mk_of_ne hq hp, abs_mk, abs_mk, inv_mk_of_ne hq hnp, mk_eq]
    have s1 := Int.sign_mul_natAbs p
    have s2 := Int.sign_mul_natAbs (p.sign * q)
    grind

theorem MyRat.inv_le_inv_of_le {q x : MyRat} (hq : 0 < q) (h : q ≤ x) : x⁻¹ ≤ q⁻¹ := by
  have hx : 0 < x := MyRat.lt_of_lt_of_le hq h
  have hxq : 0 ≤ x⁻¹ * q⁻¹ :=
    MyRat.le_of_lt (MyRat.mul_pos (MyRat.inv_pos hx) (MyRat.inv_pos hq))
  have key := MyRat.mul_le_mul_of_nonneg_right h hxq
  have e1 : q * (x⁻¹ * q⁻¹) = x⁻¹ := by
    rw [MyRat.mul_comm x⁻¹ q⁻¹, ← MyRat.mul_assoc, MyRat.mul_comm q q⁻¹,
        MyRat.inv_mul_cancel q (fun hh => by rw [hh] at hq; exact MyRat.lt_irrefl 0 hq),
        MyRat.one_mul]
  have e2 : x * (x⁻¹ * q⁻¹) = q⁻¹ := by
    rw [← MyRat.mul_assoc,
        MyRat.mul_inv_cancel x (fun hh => by rw [hh] at hx; exact MyRat.lt_irrefl 0 hx),
        MyRat.one_mul]
  rw [e1, e2] at key
  exact key

theorem MyRat.inv_sub_inv {a b : MyRat} (ha : a ≠ 0) (hb : b ≠ 0) :
    a⁻¹ - b⁻¹ = (b - a) * (a⁻¹ * b⁻¹) := by
  induction a using ind with | _ pa qa hqa =>
  induction b using ind with | _ pb qb hqb =>
  have hpa : pa ≠ 0 := by intro h; apply ha; rw [h, zero_def, mk_eq]; omega
  have hpb : pb ≠ 0 := by intro h; apply hb; rw [h, zero_def, mk_eq]; omega
  rw [inv_mk_of_ne hqa hpa, inv_mk_of_ne hqb hpb, mul_mk, sub_mk, sub_mk, mul_mk, mk_eq]
  have sa := Int.sign_mul_natAbs pa
  have sb := Int.sign_mul_natAbs pb
  grind

theorem MyRat.ne_zero_of_pos_abs {a q : MyRat} (hq : 0 < q) (h : q ≤ |a|) : a ≠ 0 := by
  intro ha
  rw [ha, MyRat.abs_zero] at h
  exact MyRat.lt_irrefl 0 (MyRat.lt_of_lt_of_le hq h)

theorem MyRat.lt_of_add_lt_add_left {a b c : MyRat} (h : a + b < a + c) : b < c := by
  have h2 := MyRat.add_lt_add_left (-a) h
  simp only [← MyRat.add_assoc, MyRat.neg_add_cancel, MyRat.zero_add] at h2
  exact h2

/-! ### Apartness: a non-null Cauchy sequence is eventually bounded away from 0 -/

/-- A sequence is *null* if it tends to `0`. -/
def CauSeq.Null (f : CauSeq) : Prop := CauchyEquiv f.seq (constSeq 0)

theorem CauSeq.apart {f : CauSeq} (hnn : ¬ CauSeq.Null f) :
    ∃ q : MyRat, 0 < q ∧ ∃ N : ℕ, ∀ n : ℕ, N ≤ n → q ≤ |f.seq n| := by
  unfold CauSeq.Null CauchyEquiv at hnn
  -- extract `∃ ε > 0, ∀ N, ∃ n ≥ N, ε ≤ |f n|` from `¬ (f → 0)`
  rw [Classical.not_forall] at hnn
  obtain ⟨ε, hε⟩ := hnn
  rw [not_imp] at hε
  obtain ⟨hεpos, hε2⟩ := hε
  rw [not_exists] at hε2
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hεpos
  obtain ⟨M, hM⟩ := f.is_cauchy η hη
  have hM2 := hε2 M
  rw [Classical.not_forall] at hM2
  obtain ⟨n0, hn0⟩ := hM2
  rw [not_imp, MyRat.not_lt] at hn0
  obtain ⟨hn0M, hn0e⟩ := hn0
  simp only [constSeq] at hn0e
  rw [MyRat.sub_zero] at hn0e
  refine ⟨η, hη, M, fun n hn => ?_⟩
  have htri : |f.seq n0| ≤ |f.seq n0 - f.seq n| + |f.seq n| := by
    calc |f.seq n0| = |(f.seq n0 - f.seq n) + f.seq n| := by rw [MyRat.sub_add_cancel]
      _ ≤ |f.seq n0 - f.seq n| + |f.seq n| := MyRat.abs_add_le _ _
  have hcau : |f.seq n0 - f.seq n| < η := hM n0 n hn0M hn
  have h1 : ε ≤ |f.seq n0 - f.seq n| + |f.seq n| := MyRat.le_trans hn0e htri
  have h2 : |f.seq n0 - f.seq n| + |f.seq n| < η + |f.seq n| :=
    MyRat.add_lt_add_right (|f.seq n|) hcau
  have h3 : ε < η + |f.seq n| := MyRat.lt_of_le_of_lt h1 h2
  rw [← hηη] at h3
  exact MyRat.le_of_lt (MyRat.lt_of_add_lt_add_left h3)

/-! ### The inverse on Cauchy sequences -/

theorem CauSeq.inv_isCauchy {f : CauSeq} (hnn : ¬ CauSeq.Null f) :
    IsCauchy (fun n => (f.seq n)⁻¹) := by
  obtain ⟨q, hq, N0, hN0⟩ := CauSeq.apart hnn
  intro ε hε
  have hC : 0 < q⁻¹ * q⁻¹ := MyRat.mul_pos (MyRat.inv_pos hq) (MyRat.inv_pos hq)
  obtain ⟨δ, hδ, hδC⟩ := exists_lt_div hε hC
  obtain ⟨N1, hN1⟩ := f.is_cauchy δ hδ
  refine ⟨Nat.max N0 N1, fun m n hm hn => ?_⟩
  have hfm : q ≤ |f.seq m| := hN0 m (Nat.le_trans (Nat.le_max_left _ _) hm)
  have hfn : q ≤ |f.seq n| := hN0 n (Nat.le_trans (Nat.le_max_left _ _) hn)
  have hfm0 : f.seq m ≠ 0 := MyRat.ne_zero_of_pos_abs hq hfm
  have hfn0 : f.seq n ≠ 0 := MyRat.ne_zero_of_pos_abs hq hfn
  have hd : |f.seq m - f.seq n| < δ :=
    hN1 m n (Nat.le_trans (Nat.le_max_right _ _) hm) (Nat.le_trans (Nat.le_max_right _ _) hn)
  show |(f.seq m)⁻¹ - (f.seq n)⁻¹| < ε
  have key : |(f.seq m)⁻¹ - (f.seq n)⁻¹| ≤ |f.seq m - f.seq n| * (q⁻¹ * q⁻¹) := by
    rw [MyRat.inv_sub_inv hfm0 hfn0, MyRat.abs_mul, MyRat.abs_mul,
        MyRat.abs_inv, MyRat.abs_inv, MyRat.abs_sub_comm (f.seq n) (f.seq m)]
    apply MyRat.mul_le_mul_of_nonneg_left _ (MyRat.abs_nonneg _)
    have ha1 : |f.seq m|⁻¹ ≤ q⁻¹ := MyRat.inv_le_inv_of_le hq hfm
    have ha2 : |f.seq n|⁻¹ ≤ q⁻¹ := MyRat.inv_le_inv_of_le hq hfn
    exact MyRat.le_trans
      (MyRat.mul_le_mul_of_nonneg_right ha1
        (MyRat.le_of_lt (MyRat.inv_pos (MyRat.lt_of_lt_of_le hq hfn))))
      (MyRat.mul_le_mul_of_nonneg_left ha2 (MyRat.le_of_lt (MyRat.inv_pos hq)))
  have hlt : |f.seq m - f.seq n| * (q⁻¹ * q⁻¹) < ε := by
    have hstep := MyRat.mul_lt_mul_of_pos_right hd hC
    rw [MyRat.mul_comm δ (q⁻¹ * q⁻¹)] at hstep
    exact MyRat.lt_trans hstep hδC
  exact MyRat.lt_of_le_of_lt key hlt

open Classical in
/-- The inverse Cauchy sequence: `0` on null sequences, termwise reciprocal otherwise. -/
noncomputable def CauSeq.inv (f : CauSeq) : CauSeq :=
  if h : CauSeq.Null f then ⟨constSeq 0, const_isCauchy 0⟩
  else ⟨fun n => (f.seq n)⁻¹, CauSeq.inv_isCauchy h⟩

theorem CauSeq.null_iff {f g : CauSeq} (hfg : f ≈ g) : CauSeq.Null f ↔ CauSeq.Null g := by
  have hfg' : CauchyEquiv f.seq g.seq := hfg
  unfold CauSeq.Null
  exact ⟨fun hf0 => equiv_trans (equiv_symm hfg') hf0, fun hg0 => equiv_trans hfg' hg0⟩

theorem CauSeq.inv_equiv {f g : CauSeq} (hfg : f ≈ g) : CauSeq.inv f ≈ CauSeq.inv g := by
  have hfg' : CauchyEquiv f.seq g.seq := hfg
  unfold CauSeq.inv
  by_cases hf : CauSeq.Null f
  · rw [dif_pos hf, dif_pos ((CauSeq.null_iff hfg).mp hf)]
    exact equiv_refl _
  · rw [dif_neg hf, dif_neg (fun hg => hf ((CauSeq.null_iff hfg).mpr hg))]
    -- both bounded away from 0 by η = qf/2 (eventually)
    obtain ⟨qf, hqf, Nf, hNf⟩ := CauSeq.apart hf
    obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hqf
    have hηqf : η ≤ qf := by
      rw [← hηη]; have h := MyRat.add_le_add_left η (MyRat.le_of_lt hη); rwa [MyRat.add_zero] at h
    obtain ⟨Ng, hNg⟩ := hfg' η hη
    intro ε hε
    have hC : 0 < η⁻¹ * η⁻¹ := MyRat.mul_pos (MyRat.inv_pos hη) (MyRat.inv_pos hη)
    obtain ⟨δ, hδ, hδC⟩ := exists_lt_div hε hC
    obtain ⟨Nd, hNd⟩ := hfg' δ hδ
    refine ⟨Nat.max (Nat.max Nf Ng) Nd, fun n hn => ?_⟩
    have hnf : Nf ≤ n := Nat.le_trans (Nat.le_trans (Nat.le_max_left _ _) (Nat.le_max_left _ _)) hn
    have hng : Ng ≤ n := Nat.le_trans (Nat.le_trans (Nat.le_max_right _ _) (Nat.le_max_left _ _)) hn
    have hnd : Nd ≤ n := Nat.le_trans (Nat.le_max_right _ _) hn
    -- |f n| ≥ η
    have hfbound : η ≤ |f.seq n| := MyRat.le_trans hηqf (hNf n hnf)
    -- |g n| ≥ η : |g n| ≥ |f n| - |f n - g n| > qf - η = η
    have hgbound : η ≤ |g.seq n| := by
      have htri : |f.seq n| ≤ |f.seq n - g.seq n| + |g.seq n| := by
        calc |f.seq n| = |(f.seq n - g.seq n) + g.seq n| := by rw [MyRat.sub_add_cancel]
          _ ≤ |f.seq n - g.seq n| + |g.seq n| := MyRat.abs_add_le _ _
      have hsmall : |f.seq n - g.seq n| < η := hNg n hng
      have h1 : qf ≤ |f.seq n - g.seq n| + |g.seq n| := MyRat.le_trans (hNf n hnf) htri
      have h2 : |f.seq n - g.seq n| + |g.seq n| < η + |g.seq n| :=
        MyRat.add_lt_add_right (|g.seq n|) hsmall
      have h3 : qf < η + |g.seq n| := MyRat.lt_of_le_of_lt h1 h2
      rw [← hηη] at h3
      exact MyRat.le_of_lt (MyRat.lt_of_add_lt_add_left h3)
    have hf0 : f.seq n ≠ 0 := MyRat.ne_zero_of_pos_abs hη hfbound
    have hg0 : g.seq n ≠ 0 := MyRat.ne_zero_of_pos_abs hη hgbound
    have hd : |f.seq n - g.seq n| < δ := hNd n hnd
    show |(f.seq n)⁻¹ - (g.seq n)⁻¹| < ε
    have key : |(f.seq n)⁻¹ - (g.seq n)⁻¹| ≤ |f.seq n - g.seq n| * (η⁻¹ * η⁻¹) := by
      rw [MyRat.inv_sub_inv hf0 hg0, MyRat.abs_mul, MyRat.abs_mul,
          MyRat.abs_inv, MyRat.abs_inv, MyRat.abs_sub_comm (g.seq n) (f.seq n)]
      apply MyRat.mul_le_mul_of_nonneg_left _ (MyRat.abs_nonneg _)
      exact MyRat.le_trans
        (MyRat.mul_le_mul_of_nonneg_right (MyRat.inv_le_inv_of_le hη hfbound)
          (MyRat.le_of_lt (MyRat.inv_pos (MyRat.lt_of_lt_of_le hη hgbound))))
        (MyRat.mul_le_mul_of_nonneg_left (MyRat.inv_le_inv_of_le hη hgbound)
          (MyRat.le_of_lt (MyRat.inv_pos hη)))
    have hlt : |f.seq n - g.seq n| * (η⁻¹ * η⁻¹) < ε := by
      have hstep := MyRat.mul_lt_mul_of_pos_right hd hC
      rw [MyRat.mul_comm δ (η⁻¹ * η⁻¹)] at hstep
      exact MyRat.lt_trans hstep hδC
    exact MyRat.lt_of_le_of_lt key hlt

/-! ### The inverse on ℝ -/

namespace MyReal

noncomputable instance : Inv MyReal :=
  ⟨Quotient.lift (fun f => Quotient.mk _ (CauSeq.inv f))
    (fun _ _ h => Quotient.sound (CauSeq.inv_equiv h))⟩

/-- `mk f hf = 0` exactly when the sequence is null. -/
theorem mk_eq_zero_iff {f : ℕ → MyRat} {hf : IsCauchy f} :
    mk f hf = 0 ↔ CauSeq.Null ⟨f, hf⟩ := by
  constructor
  · intro h; exact MyReal.exact (by rw [h, zero_def])
  · intro h; rw [zero_def]; exact eq_of_equiv h

/-- Reduce a nonzero real's inverse to the termwise reciprocal of a representative. -/
theorem inv_mk_of_not_null {f : ℕ → MyRat} {hf : IsCauchy f} (hnn : ¬ CauSeq.Null ⟨f, hf⟩) :
    (mk f hf)⁻¹ = mk (fun n => (f n)⁻¹) (CauSeq.inv_isCauchy hnn) := by
  show Quotient.mk CauSeq.setoid (CauSeq.inv ⟨f, hf⟩) = _
  unfold CauSeq.inv; rw [dif_neg hnn]; rfl

end MyReal
end Analysis
