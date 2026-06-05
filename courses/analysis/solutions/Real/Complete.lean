/-
Infrastructure (given): the ingredients for ℝ's own Cauchy-completeness — that a
Cauchy sequence of *reals* converges. The strategy is rational approximation:
approximate each `x k` by a rational `q k` to within `1/(k+1)`, show `(q k)` is a
Cauchy sequence of rationals, and prove `x` converges to the real it represents.

This module records the helpers; the `Complete` world proves the approximation
lemma and the completeness theorem.
-/
import RealField.mul_inv_cancel

namespace Analysis
open MyRat

theorem MyRat.sub_pos {a b : MyRat} : 0 < a - b ↔ b < a := by
  induction a using ind with | _ pa qa ha =>
  induction b using ind with | _ pb qb hb =>
  simp only [sub_mk, zero_def, lt_mk, Int.neg_mul]
  omega

theorem MyRat.add_neg_add (c a b : MyRat) : (c + b) + -(c + a) = b + -a := by
  induction a using ind with | _ pa qa ha =>
  induction b using ind with | _ pb qb hb =>
  induction c using ind with | _ pc qc hc =>
  simp only [add_mk, neg_mk, mk_eq]; grind

namespace MyReal

/-! ### `ofRat` is an order/abs homomorphism -/

theorem ofRat_sub (a b : MyRat) : ofRat (a - b) = ofRat a - ofRat b := by
  rw [ofRat_def, ofRat_def, ofRat_def, sub_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => by simp only [constSeq]; exact MyRat.sub_eq a b))

theorem ofRat_abs (a : MyRat) : ofRat |a| = |ofRat a| := by
  rw [ofRat_def, ofRat_def, abs_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => rfl))

theorem isPos_ofRat_iff {c : MyRat} : IsPos (ofRat c) ↔ 0 < c := by
  rw [ofRat_def, isPos_mk]
  constructor
  · rintro ⟨q, hq, N, hN⟩
    have hc := hN N (Nat.le_refl N)
    simp only [constSeq] at hc
    exact MyRat.lt_of_lt_of_le hq hc
  · intro hc
    exact ⟨c, hc, 0, fun n _ => by simp only [constSeq]; exact MyRat.le_refl c⟩

theorem ofRat_lt_iff {a b : MyRat} : ofRat a < ofRat b ↔ a < b := by
  rw [lt_def, ← ofRat_sub, isPos_ofRat_iff, MyRat.sub_pos]

theorem ofRat_lt {a b : MyRat} (h : a < b) : ofRat a < ofRat b := ofRat_lt_iff.mpr h

/-! ### A real order helper -/

theorem add_le_add_left {a b : MyReal} (c : MyReal) (h : a ≤ b) : c + a ≤ c + b := by
  induction a using MyReal.ind with | _ f hf =>
  induction b using MyReal.ind with | _ g hg =>
  induction c using MyReal.ind with | _ h2 hh2 =>
  rw [le_def] at h ⊢
  have hid : (mk h2 hh2 + mk g hg) - (mk h2 hh2 + mk f hf) = mk g hg - mk f hf := by
    rw [add_mk, add_mk, sub_mk, sub_mk]
    exact eq_of_equiv (equiv_of_eq (fun n => MyRat.add_neg_add (h2 n) (f n) (g n)))
  rw [hid]; exact h

/-! ### The tolerance sequence `1/(k+1) → 0` -/

/-- The tolerance sequence `1/(k+1)`. -/
def tolSeq (k : ℕ) : MyRat := MyRat.mk 1 ((k : Int) + 1) (by omega)

theorem tolSeq_pos (k : ℕ) : 0 < tolSeq k := by
  rw [tolSeq, MyRat.zero_def, MyRat.lt_mk]; omega

theorem tolSeq_lt {ε : MyRat} (hε : 0 < ε) : ∃ K : ℕ, ∀ k : ℕ, K ≤ k → tolSeq k < ε := by
  induction ε using MyRat.ind with | _ a b hb =>
  rw [MyRat.zero_def, MyRat.lt_mk] at hε
  refine ⟨b.toNat, fun k hk => ?_⟩
  rw [tolSeq, MyRat.lt_mk]
  have hb2 : b < (k : Int) + 1 := by omega
  have hstep : 1 * ((k : Int) + 1) ≤ a * ((k : Int) + 1) :=
    Int.mul_le_mul_of_nonneg_right (by omega) (by omega)
  omega

end MyReal
end Analysis
