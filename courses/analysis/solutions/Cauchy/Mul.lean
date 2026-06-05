/-
Infrastructure (given): the harder structural facts about Cauchy sequences that
the construction of ℝ needs but that are heavy to do by hand —

  • every Cauchy sequence is bounded (`cauchy_bounded`), via a running maximum;
  • for `0 < ε` and `0 < C` there is a `0 < δ` with `C * δ < ε` (`exists_lt_div`),
    which is how a product gets controlled;
  • the product of two Cauchy sequences is Cauchy (`mul_isCauchy`).

These are given rather than set as exercises: the ε–N bookkeeping is real, but it
is the same kind of argument you practised in the `Cauchy` world, just longer.
-/
import Cauchy.equiv_trans

namespace Analysis
open MyRat

/-- Given `0 < ε` and `0 < C`, some positive `δ` has `C * δ < ε`. (Take `δ = ε / (C+1)`.) -/
theorem exists_lt_div {ε C : MyRat} (hε : 0 < ε) (hC : 0 < C) :
    ∃ δ : MyRat, 0 < δ ∧ C * δ < ε := by
  have hC1 : 0 < C + 1 := MyRat.lt_trans hC (by
    have h := MyRat.add_lt_add_left C MyRat.zero_lt_one
    rwa [MyRat.add_zero] at h)
  have hC1' : C + 1 ≠ 0 := fun h => absurd (h ▸ hC1) (MyRat.lt_irrefl 0)
  refine ⟨ε * (C + 1)⁻¹, MyRat.mul_pos hε (MyRat.inv_pos hC1), ?_⟩
  -- It suffices to compare after multiplying by the positive `C + 1`.
  apply MyRat.lt_of_mul_lt_mul_right hC1
  have hinv : (C + 1)⁻¹ * (C + 1) = 1 := MyRat.inv_mul_cancel _ hC1'
  have lhs : (C * (ε * (C + 1)⁻¹)) * (C + 1) = C * ε := by
    rw [← MyRat.mul_assoc C ε ((C + 1)⁻¹), MyRat.mul_assoc (C * ε) ((C + 1)⁻¹) (C + 1),
      hinv, MyRat.mul_one]
  rw [lhs, MyRat.left_distrib, MyRat.mul_one, MyRat.mul_comm C ε]
  have h := MyRat.add_lt_add_left (ε * C) hε
  rwa [MyRat.add_zero] at h

/-- `a * b - c * d = (a - c) * b + c * (b - d)`. -/
theorem MyRat.mul_sub_mul (a b c d : MyRat) :
    a * b - c * d = (a - c) * b + c * (b - d) := by
  induction a using ind with | _ pa qa ha =>
  induction b using ind with | _ pb qb hb =>
  induction c using ind with | _ pc qc hc =>
  induction d using ind with | _ pd qd hd =>
  rw [mul_mk, mul_mk, sub_mk, sub_mk, mul_mk, sub_mk, mul_mk, add_mk, mk_eq]; grind

/-- A running maximum of `|f 0|, …, |f n|`. -/
def boundUpto (f : ℕ → MyRat) : ℕ → MyRat
  | 0 => Abs.abs (f 0)
  | (n + 1) => MyRat.max (boundUpto f n) (Abs.abs (f (n + 1)))

theorem le_boundUpto (f : ℕ → MyRat) {k n : ℕ} (h : k ≤ n) : |f k| ≤ boundUpto f n := by
  induction n with
  | zero =>
    have hk : k = 0 := Nat.le_zero.mp h
    subst hk; exact MyRat.le_refl _
  | succ m ih =>
    show |f k| ≤ MyRat.max (boundUpto f m) (|f (m + 1)|)
    rcases Nat.eq_or_lt_of_le h with hk | hk
    · subst hk; exact MyRat.le_max_right _ _
    · exact MyRat.le_trans (ih (Nat.lt_succ_iff.mp hk)) (MyRat.le_max_left _ _)

/-- Every Cauchy sequence is bounded. -/
theorem cauchy_bounded {f : ℕ → MyRat} (hf : IsCauchy f) : IsBounded f := by
  obtain ⟨N, hN⟩ := hf 1 MyRat.zero_lt_one
  refine ⟨MyRat.max (boundUpto f N) (1 + |f N|), fun n => ?_⟩
  rcases Nat.lt_or_ge n N with hn | hn
  · exact MyRat.le_trans (le_boundUpto f (Nat.le_of_lt hn)) (MyRat.le_max_left _ _)
  · have hb := hN n N hn (Nat.le_refl N)
    have htri : |f n| ≤ 1 + |f N| := by
      calc |f n| = |(f n - f N) + f N| := by rw [MyRat.sub_add_cancel]
        _ ≤ |f n - f N| + |f N| := MyRat.abs_add_le _ _
        _ ≤ 1 + |f N| := MyRat.add_le_add_right _ (MyRat.le_of_lt hb)
    exact MyRat.le_trans htri (MyRat.le_max_right _ _)

/-- The product of two Cauchy sequences is Cauchy. -/
theorem mul_isCauchy {f g : ℕ → MyRat} (hf : IsCauchy f) (hg : IsCauchy g) :
    IsCauchy (fun n => f n * g n) := by
  obtain ⟨Af, hAf⟩ := cauchy_bounded hf
  obtain ⟨Ag, hAg⟩ := cauchy_bounded hg
  -- a single positive bound `C` dominating every `|f n|` and `|g n|`
  have hC0 : (0 : MyRat) ≤ MyRat.max Af Ag :=
    MyRat.le_trans (MyRat.abs_nonneg (f 0)) (MyRat.le_trans (hAf 0) (MyRat.le_max_left _ _))
  have hCpos : 0 < MyRat.max Af Ag + 1 :=
    MyRat.lt_of_le_of_lt hC0 (by
      have h := MyRat.add_lt_add_left (MyRat.max Af Ag) MyRat.zero_lt_one
      rwa [MyRat.add_zero] at h)
  have hfC : ∀ n, |f n| ≤ MyRat.max Af Ag + 1 := fun n =>
    MyRat.le_trans (hAf n) (MyRat.le_trans (MyRat.le_max_left _ _) (MyRat.le_add_one _))
  have hgC : ∀ n, |g n| ≤ MyRat.max Af Ag + 1 := fun n =>
    MyRat.le_trans (hAg n) (MyRat.le_trans (MyRat.le_max_right _ _) (MyRat.le_add_one _))
  intro ε hε
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hε
  obtain ⟨δ, hδ, hδC⟩ := exists_lt_div hη hCpos
  obtain ⟨Nf, hNf⟩ := hf δ hδ
  obtain ⟨Ng, hNg⟩ := hg δ hδ
  refine ⟨Nat.max Nf Ng, fun m n hm hn => ?_⟩
  have t1 := hNf m n (Nat.le_trans (Nat.le_max_left _ _) hm) (Nat.le_trans (Nat.le_max_left _ _) hn)
  have t2 := hNg m n (Nat.le_trans (Nat.le_max_right _ _) hm) (Nat.le_trans (Nat.le_max_right _ _) hn)
  show |f m * g m - f n * g n| < ε
  have term1 : |f m - f n| * |g m| < η := by
    calc |f m - f n| * |g m|
        ≤ |f m - f n| * (MyRat.max Af Ag + 1) :=
          MyRat.mul_le_mul_of_nonneg_left (hgC m) (MyRat.abs_nonneg _)
      _ < δ * (MyRat.max Af Ag + 1) := MyRat.mul_lt_mul_of_pos_right t1 hCpos
      _ = (MyRat.max Af Ag + 1) * δ := MyRat.mul_comm _ _
      _ < η := hδC
  have term2 : |f n| * |g m - g n| < η := by
    calc |f n| * |g m - g n|
        ≤ (MyRat.max Af Ag + 1) * |g m - g n| :=
          MyRat.mul_le_mul_of_nonneg_right (hfC n) (MyRat.abs_nonneg _)
      _ < (MyRat.max Af Ag + 1) * δ := MyRat.mul_lt_mul_of_pos_left t2 hCpos
      _ < η := hδC
  calc |f m * g m - f n * g n|
      = |(f m - f n) * g m + f n * (g m - g n)| := by rw [MyRat.mul_sub_mul]
    _ ≤ |(f m - f n) * g m| + |f n * (g m - g n)| := MyRat.abs_add_le _ _
    _ = |f m - f n| * |g m| + |f n| * |g m - g n| := by rw [MyRat.abs_mul, MyRat.abs_mul]
    _ < η + η := MyRat.add_lt_add term1 term2
    _ = ε := hηη

end Analysis
