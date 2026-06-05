/-
Infrastructure (given): abstract metric spaces, with ℝ as the leading example.

A `MetricSpace` is a type with an ℝ-valued distance satisfying the usual axioms.
We instantiate it for `MyReal` via `dist x y = |x - y|` (all five axioms reduce
to the absolute-value theory you have), and define convergence, Cauchy
sequences, and completeness generically. The `Metric` world then proves the
basic theory from the axioms.

A few ℝ order facts are recorded first (`add_lt_add`, `lt_of_le_of_lt`).
-/
import Capstone.cauchy_seq_converges

namespace Analysis
open MyRat

/-! ### A little more ℝ order -/

theorem MyRat.add_sub_add_comm (a b c d : MyRat) :
    (a + -b) + (c + -d) = (a + c) + -(b + d) := by
  induction a using ind with | _ pa qa ha =>
  induction b using ind with | _ pb qb hb =>
  induction c using ind with | _ pc qc hc =>
  induction d using ind with | _ pd qd hd =>
  simp only [neg_mk, add_mk, mk_eq]; grind

namespace MyReal

theorem add_sub_add_comm (a b c d : MyReal) : (a - b) + (c - d) = (a + c) - (b + d) := by
  induction a using MyReal.ind with | _ f hf =>
  induction b using MyReal.ind with | _ g hg =>
  induction c using MyReal.ind with | _ h hh =>
  induction d using MyReal.ind with | _ k hk =>
  simp only [sub_mk, add_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.add_sub_add_comm _ _ _ _))

theorem add_lt_add {a b c d : MyReal} (h1 : a < b) (h2 : c < d) : a + c < b + d := by
  rw [lt_def] at *
  have h := IsPos_add h1 h2
  rwa [add_sub_add_comm] at h

theorem IsPos_add_nonneg {a b : MyReal} (ha : IsPos a) (hb : Nonneg b) : IsPos (a + b) := by
  induction a using MyReal.ind with | _ f hf =>
  induction b using MyReal.ind with | _ g hg =>
  have ha' : CauSeq.Pos ⟨f, hf⟩ := ha
  have hb' : CauSeq.Nonneg ⟨g, hg⟩ := hb
  rw [add_mk]
  obtain ⟨q, hq, N1, hN1⟩ := ha'
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hq
  obtain ⟨N2, hN2⟩ := hb' η hη
  refine ⟨η, hη, Nat.max N1 N2, fun n hn => ?_⟩
  have h1 : η + η ≤ f n := by rw [hηη]; exact hN1 n (Nat.le_trans (Nat.le_max_left _ _) hn)
  have h2 : -η ≤ g n := hN2 n (Nat.le_trans (Nat.le_max_right _ _) hn)
  have step := MyRat.add_le_add h1 h2
  rwa [MyRat.add_assoc, MyRat.add_neg_cancel, MyRat.add_zero] at step

theorem lt_of_le_of_lt {a b c : MyReal} (hab : a ≤ b) (hbc : b < c) : a < c := by
  rw [le_def] at hab; rw [lt_def] at hbc ⊢
  have h := IsPos_add_nonneg hbc hab
  rwa [add_sub_add_telescope] at h

instance : Trans (· ≤ · : MyReal → MyReal → Prop) (· < ·) (· < ·) := ⟨lt_of_le_of_lt⟩

end MyReal

/-! ### Metric spaces -/

/-- A **metric space**: a type with an ℝ-valued distance satisfying the axioms. -/
class MetricSpace (X : Type _) where
  dist : X → X → MyReal
  dist_nonneg : ∀ x y, (0 : MyReal) ≤ dist x y
  dist_self : ∀ x, dist x x = 0
  dist_eq_zero : ∀ {x y}, dist x y = 0 → x = y
  dist_comm : ∀ x y, dist x y = dist y x
  dist_triangle : ∀ x y z, dist x z ≤ dist x y + dist y z

export MetricSpace (dist dist_nonneg dist_self dist_eq_zero dist_comm dist_triangle)

/-- ℝ is a metric space under `dist x y = |x - y|`. -/
instance : MetricSpace MyReal where
  dist x y := |x - y|
  dist_nonneg x y := MyReal.abs_nonneg _
  dist_self x := by show |x - x| = 0; rw [MyReal.sub_self]; exact MyReal.abs_zero
  dist_eq_zero h := MyReal.eq_of_sub_eq_zero (MyReal.abs_eq_zero h)
  dist_comm x y := MyReal.abs_sub_comm x y
  dist_triangle x y z := MyReal.abs_sub_le x y z

/-- `x n → L` in a metric space: the distance to `L` is eventually below any `ε > 0`. -/
def Converges {X : Type _} [MetricSpace X] (x : ℕ → X) (L : X) : Prop :=
  ∀ ε : MyRat, 0 < ε → ∃ N : ℕ, ∀ n : ℕ, N ≤ n → dist (x n) L < MyReal.ofRat ε

/-- A sequence whose terms get arbitrarily close to each other. -/
def IsCauchySeq {X : Type _} [MetricSpace X] (x : ℕ → X) : Prop :=
  ∀ ε : MyRat, 0 < ε → ∃ N : ℕ, ∀ m n : ℕ, N ≤ m → N ≤ n → dist (x m) (x n) < MyReal.ofRat ε

/-- A metric space is **complete** if every Cauchy sequence converges. -/
def IsComplete (X : Type _) [MetricSpace X] : Prop :=
  ∀ x : ℕ → X, IsCauchySeq x → ∃ L : X, Converges x L

end Analysis
