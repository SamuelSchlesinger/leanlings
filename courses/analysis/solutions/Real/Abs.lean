/-
Infrastructure (given): the absolute value on ℝ, defined pointwise
(`|⟦f⟧| = ⟦fun n => |f n|⟧`). The key fact is the reverse triangle inequality on
ℚ, `abs_sub_abs_le`, which makes `|·|` 1-Lipschitz, hence Cauchy-preserving and
`CauchyEquiv`-respecting. This gives the distance `dist x y = |x - y|` used for
metric spaces.
-/
import Real.Order

namespace Analysis
open MyRat

/-! ### ℚ helpers: the `≤` form of `abs`, and the reverse triangle inequality -/

theorem MyRat.abs_le {x y : MyRat} : |x| ≤ y ↔ -y ≤ x ∧ x ≤ y := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  simp only [abs_mk, neg_mk, le_mk, Int.neg_mul]
  by_cases h : 0 ≤ a
  · have hh : (a.natAbs : Int) * d = a * d := by
      have : (a.natAbs : Int) = a := by omega
      rw [this]
    rw [hh]
    have h2 : 0 ≤ a * d := Int.mul_nonneg h (Int.le_of_lt hd)
    omega
  · have hh : (a.natAbs : Int) * d = -(a * d) := by
      have : (a.natAbs : Int) = -a := by omega
      rw [this, Int.neg_mul]
    rw [hh]
    have h2 : a * d < 0 := Int.mul_neg_of_neg_of_pos (by omega) hd
    omega

theorem MyRat.sub_le_iff {a b c : MyRat} : a - b ≤ c ↔ a ≤ c + b := by
  constructor
  · intro h
    have h2 := MyRat.add_le_add_right b h
    rwa [MyRat.sub_add_cancel] at h2
  · intro h
    have h2 := MyRat.add_le_add_right (-b) h
    rw [← MyRat.sub_eq, MyRat.add_assoc, MyRat.add_neg_cancel, MyRat.add_zero] at h2
    exact h2

theorem MyRat.neg_le_neg {a b : MyRat} (h : a ≤ b) : -b ≤ -a := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  rw [le_mk] at h
  rw [neg_mk, neg_mk, le_mk]
  simp only [Int.neg_mul]
  omega

theorem MyRat.abs_sub_abs_le (a b : MyRat) : |(|a| - |b|)| ≤ |a - b| := by
  rw [MyRat.abs_le]
  refine ⟨?_, ?_⟩
  · have t2 : |b| ≤ |a - b| + |a| := by
      calc |b| = |(b - a) + a| := by rw [MyRat.sub_add_cancel]
        _ ≤ |b - a| + |a| := MyRat.abs_add_le _ _
        _ = |a - b| + |a| := by rw [MyRat.abs_sub_comm b a]
    have t3 : |b| - |a| ≤ |a - b| := MyRat.sub_le_iff.mpr t2
    have h := MyRat.neg_le_neg t3
    rwa [MyRat.neg_sub] at h
  · have t : |a| ≤ |a - b| + |b| := by
      calc |a| = |(a - b) + b| := by rw [MyRat.sub_add_cancel]
        _ ≤ |a - b| + |b| := MyRat.abs_add_le _ _
    exact MyRat.sub_le_iff.mpr t

theorem MyRat.sub_zero (a : MyRat) : a - 0 = a := by
  rw [MyRat.sub_eq, MyRat.neg_zero, MyRat.add_zero]

theorem MyRat.abs_abs (a : MyRat) : |(|a|)| = |a| := by
  induction a using ind with | _ p q hq =>
  rw [abs_mk, abs_mk, mk_eq]
  have h : ((p.natAbs : Int).natAbs : Int) = (p.natAbs : Int) := by omega
  rw [h]

/-! ### Absolute value on ℝ -/

theorem abs_isCauchy {f : ℕ → MyRat} (hf : IsCauchy f) : IsCauchy (fun n => |f n|) := by
  intro ε hε
  obtain ⟨N, hN⟩ := hf ε hε
  refine ⟨N, fun m n hm hn => ?_⟩
  show |(|f m| - |f n|)| < ε
  exact MyRat.lt_of_le_of_lt (MyRat.abs_sub_abs_le (f m) (f n)) (hN m n hm hn)

theorem abs_equiv {f g : ℕ → MyRat} (h : CauchyEquiv f g) :
    CauchyEquiv (fun n => |f n|) (fun n => |g n|) := by
  intro ε hε
  obtain ⟨N, hN⟩ := h ε hε
  refine ⟨N, fun n hn => ?_⟩
  show |(|f n| - |g n|)| < ε
  exact MyRat.lt_of_le_of_lt (MyRat.abs_sub_abs_le (f n) (g n)) (hN n hn)

namespace CauSeq
def absSeq (f : CauSeq) : CauSeq := ⟨fun n => |f.seq n|, abs_isCauchy f.is_cauchy⟩
theorem abs_equiv' {f g : CauSeq} (h : f ≈ g) : absSeq f ≈ absSeq g := abs_equiv h
end CauSeq

namespace MyReal
instance : Abs MyReal :=
  ⟨Quotient.lift (fun f => Quotient.mk _ (CauSeq.absSeq f))
    (fun _ _ h => Quotient.sound (CauSeq.abs_equiv' h))⟩

theorem abs_mk (f : ℕ → MyRat) (hf : IsCauchy f) :
    |mk f hf| = mk (fun n => |f n|) (abs_isCauchy hf) := rfl

/-! ### Theory of `|·|` on ℝ (used for the metric) -/

theorem abs_nonneg (x : MyReal) : 0 ≤ |x| := by
  induction x using MyReal.ind with | _ f hf =>
  rw [abs_mk]
  exact nonneg_of_eventually (fun n => MyRat.abs_nonneg (f n))

theorem abs_zero : |(0 : MyReal)| = 0 := by
  rw [zero_def, abs_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => by simp only [constSeq]; exact MyRat.abs_zero))

theorem abs_sub_comm (x y : MyReal) : |x - y| = |y - x| := by
  induction x using MyReal.ind with | _ f hf =>
  induction y using MyReal.ind with | _ g hg =>
  rw [sub_mk, sub_mk, abs_mk, abs_mk]
  refine eq_of_equiv (equiv_of_eq (fun n => ?_))
  rw [← MyRat.sub_eq, ← MyRat.sub_eq, MyRat.abs_sub_comm]

theorem abs_add_le (x y : MyReal) : |x + y| ≤ |x| + |y| := by
  induction x using MyReal.ind with | _ f hf =>
  induction y using MyReal.ind with | _ g hg =>
  rw [add_mk, abs_mk, abs_mk, abs_mk, add_mk, le_def, sub_mk]
  intro ε hε
  refine ⟨0, fun n _ => ?_⟩
  have htri : |f n + g n| ≤ |f n| + |g n| := MyRat.abs_add_le (f n) (g n)
  have h0 : (0 : MyRat) ≤ (|f n| + |g n|) + -|f n + g n| := by
    rw [← MyRat.sub_eq]
    exact MyRat.le_sub_iff.mpr (by rw [MyRat.zero_add]; exact htri)
  exact MyRat.le_trans (MyRat.neg_nonpos_of_pos hε) h0

/-- The reverse of `add_sub_add_telescope`, for the metric triangle inequality. -/
theorem abs_sub_le (x y z : MyReal) : |x - z| ≤ |x - y| + |y - z| := by
  rw [← add_sub_add_telescope z y x]
  exact abs_add_le (x - y) (y - z)

/-- The `exact` direction for `MyReal`: equal-in-the-quotient gives `CauchyEquiv`. -/
theorem exact {f g : ℕ → MyRat} {hf : IsCauchy f} {hg : IsCauchy g}
    (h : mk f hf = mk g hg) : CauchyEquiv f g := Quotient.exact h

theorem abs_eq_zero {z : MyReal} (h : |z| = 0) : z = 0 := by
  induction z using MyReal.ind with | _ f hf =>
  rw [abs_mk, zero_def] at h
  have heq : CauchyEquiv (fun n => |f n|) (constSeq 0) := exact h
  rw [zero_def]
  refine eq_of_equiv (fun ε hε => ?_)
  obtain ⟨N, hN⟩ := heq ε hε
  refine ⟨N, fun n hn => ?_⟩
  have hb := hN n hn
  simp only [constSeq] at hb ⊢
  rw [MyRat.sub_zero] at hb ⊢
  rwa [MyRat.abs_abs] at hb

theorem sub_add_cancel (x y : MyReal) : (x - y) + y = x := by
  induction x using MyReal.ind with | _ f hf =>
  induction y using MyReal.ind with | _ g hg =>
  rw [sub_mk, add_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => by
    rw [MyRat.add_assoc, MyRat.neg_add_cancel, MyRat.add_zero]))

theorem eq_of_sub_eq_zero {x y : MyReal} (h : x - y = 0) : x = y := by
  have hxy : x - y + y = 0 + y := by rw [h]
  rwa [MyReal.sub_add_cancel, MyReal.zero_add] at hxy

end MyReal
end Analysis
