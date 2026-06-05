/-
Infrastructure (given): the order on ℝ.

A real is *positive* when some representative is eventually bounded below by a
fixed positive rational (`CauSeq.Pos`); this respects `CauchyEquiv`
(`pos_equiv`), so it descends to `MyReal.IsPos`. Then `x < y := IsPos (y - x)`
and `x ≤ y := IsPos (y - x) ∨ x = y`.

We also record the few ℚ "transposition" lemmas (`sub_lt_iff`, `le_sub_iff`, …)
the well-definedness argument needs, and prove the basic order facts.
-/
import Real.ofRat_mul

namespace Analysis
open MyRat

/-! ### ℚ transposition helpers -/

theorem MyRat.sub_eq (a b : MyRat) : a - b = a + -b := rfl

theorem MyRat.add_neg_cancel (a : MyRat) : a + -a = 0 := by
  rw [MyRat.add_comm]; exact MyRat.neg_add_cancel a

theorem MyRat.add_le_add {a b c d : MyRat} (h1 : a ≤ b) (h2 : c ≤ d) : a + c ≤ b + d :=
  MyRat.le_trans (MyRat.add_le_add_right c h1) (MyRat.add_le_add_left b h2)

theorem MyRat.telescope (a b c : MyRat) : (a + -b) + (b + -c) = a + -c := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  induction c using ind with | _ t u hu =>
  simp only [neg_mk, add_mk, mk_eq]; grind

theorem MyRat.sub_lt_iff {a b c : MyRat} : a - b < c ↔ a < c + b := by
  constructor
  · intro h
    have h2 := MyRat.add_lt_add_right b h
    rwa [MyRat.sub_add_cancel] at h2
  · intro h
    have h2 := MyRat.add_lt_add_right (-b) h
    rw [← MyRat.sub_eq, MyRat.add_assoc, MyRat.add_neg_cancel, MyRat.add_zero] at h2
    exact h2

theorem MyRat.sub_lt_comm {a b c : MyRat} : a - b < c ↔ a - c < b := by
  rw [MyRat.sub_lt_iff, MyRat.sub_lt_iff, MyRat.add_comm]

theorem MyRat.le_sub_iff {a b c : MyRat} : a ≤ b - c ↔ a + c ≤ b := by
  constructor
  · intro h
    have h2 := MyRat.add_le_add_right c h
    rwa [MyRat.sub_add_cancel] at h2
  · intro h
    have h2 := MyRat.add_le_add_right (-c) h
    rw [MyRat.add_assoc, MyRat.add_neg_cancel, MyRat.add_zero, ← MyRat.sub_eq] at h2
    exact h2

theorem MyRat.neg_zero : -(0 : MyRat) = 0 := rfl

theorem MyRat.neg_add (a b : MyRat) : -(a + b) = -a + -b := by
  induction a using ind with | _ p q hq =>
  induction b using ind with | _ r s hs =>
  simp only [add_mk, neg_mk, mk_eq]; grind

theorem MyRat.neg_nonpos_of_pos {ε : MyRat} (h : 0 < ε) : -ε ≤ 0 := by
  induction ε using ind with | _ p q hq =>
  rw [zero_def, lt_mk] at h
  rw [neg_mk, zero_def, le_mk]; omega

/-! ### Positivity of a real -/

namespace CauSeq

/-- A Cauchy sequence is *positive* if eventually bounded below by a fixed `q > 0`. -/
def Pos (f : CauSeq) : Prop :=
  ∃ q : MyRat, 0 < q ∧ ∃ N : ℕ, ∀ n : ℕ, N ≤ n → q ≤ f.seq n

theorem pos_equiv {f g : CauSeq} (h : f ≈ g) (hp : Pos f) : Pos g := by
  have hfg : CauchyEquiv f.seq g.seq := h
  obtain ⟨q, hq, N1, hN1⟩ := hp
  obtain ⟨δ, hδ, hδδ⟩ := MyRat.exists_half hq
  obtain ⟨N2, hN2⟩ := hfg δ hδ
  refine ⟨δ, hδ, Nat.max N1 N2, fun n hn => ?_⟩
  have hf := hN1 n (Nat.le_trans (Nat.le_max_left _ _) hn)
  have hd := hN2 n (Nat.le_trans (Nat.le_max_right _ _) hn)
  have hd2 : f.seq n - g.seq n < δ := (MyRat.abs_lt.mp hd).2
  have h3 : f.seq n - δ < g.seq n := MyRat.sub_lt_comm.mp hd2
  have h4 : δ ≤ f.seq n - δ := MyRat.le_sub_iff.mpr (by rw [hδδ]; exact hf)
  exact MyRat.le_of_lt (MyRat.lt_of_le_of_lt h4 h3)

/-- Positivity is preserved by adding two positive sequences. -/
theorem pos_add {f g : CauSeq} (hf : Pos f) (hg : Pos g) : Pos (add f g) := by
  obtain ⟨q1, hq1, N1, hN1⟩ := hf
  obtain ⟨q2, hq2, N2, hN2⟩ := hg
  refine ⟨q1 + q2, ?_, Nat.max N1 N2, fun n hn => ?_⟩
  · have h := MyRat.add_lt_add hq1 hq2; rwa [MyRat.add_zero] at h
  · show q1 + q2 ≤ f.seq n + g.seq n
    exact MyRat.add_le_add
      (hN1 n (Nat.le_trans (Nat.le_max_left _ _) hn))
      (hN2 n (Nat.le_trans (Nat.le_max_right _ _) hn))

/-- A Cauchy sequence is *nonnegative* if eventually bounded below by `-ε`, for
every `ε > 0`. -/
def Nonneg (f : CauSeq) : Prop :=
  ∀ ε : MyRat, 0 < ε → ∃ N : ℕ, ∀ n : ℕ, N ≤ n → -ε ≤ f.seq n

theorem nonneg_equiv {f g : CauSeq} (h : f ≈ g) (hp : Nonneg f) : Nonneg g := by
  have hfg : CauchyEquiv f.seq g.seq := h
  intro ε hε
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hε
  obtain ⟨N1, hN1⟩ := hp η hη
  obtain ⟨N2, hN2⟩ := hfg η hη
  refine ⟨Nat.max N1 N2, fun n hn => ?_⟩
  have hfn : -η ≤ f.seq n := hN1 n (Nat.le_trans (Nat.le_max_left _ _) hn)
  have hd := hN2 n (Nat.le_trans (Nat.le_max_right _ _) hn)
  have hgn : f.seq n - η < g.seq n := MyRat.sub_lt_comm.mp ((MyRat.abs_lt.mp hd).2)
  have hle : -ε ≤ f.seq n - η := by
    rw [show (-ε : MyRat) = -η + -η from by rw [← hηη, MyRat.neg_add], MyRat.sub_eq]
    exact MyRat.add_le_add_right (-η) hfn
  exact MyRat.le_of_lt (MyRat.lt_of_le_of_lt hle hgn)

theorem nonneg_of_pos {f : CauSeq} (hp : Pos f) : Nonneg f := by
  obtain ⟨q, hq, N, hN⟩ := hp
  intro ε hε
  refine ⟨N, fun n hn => ?_⟩
  exact MyRat.le_trans (MyRat.neg_nonpos_of_pos hε) (MyRat.le_trans (MyRat.le_of_lt hq) (hN n hn))

theorem nonneg_add {f g : CauSeq} (hf : Nonneg f) (hg : Nonneg g) : Nonneg (add f g) := by
  intro ε hε
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hε
  obtain ⟨N1, hN1⟩ := hf η hη
  obtain ⟨N2, hN2⟩ := hg η hη
  refine ⟨Nat.max N1 N2, fun n hn => ?_⟩
  show -ε ≤ f.seq n + g.seq n
  rw [show (-ε : MyRat) = -η + -η from by rw [← hηη, MyRat.neg_add]]
  exact MyRat.add_le_add
    (hN1 n (Nat.le_trans (Nat.le_max_left _ _) hn))
    (hN2 n (Nat.le_trans (Nat.le_max_right _ _) hn))

end CauSeq

namespace MyReal

/-- `x` is positive: some representative is eventually `≥` a fixed positive rational. -/
def IsPos : MyReal → Prop :=
  Quotient.lift CauSeq.Pos
    (fun _ _ h => propext ⟨fun hp => CauSeq.pos_equiv h hp, fun hp => CauSeq.pos_equiv (Setoid.symm h) hp⟩)

instance : LT MyReal := ⟨fun x y => IsPos (y - x)⟩

/-- `x` is nonnegative: every representative is eventually `≥ -ε`, for all `ε > 0`. -/
def Nonneg : MyReal → Prop :=
  Quotient.lift CauSeq.Nonneg
    (fun _ _ h => propext ⟨fun hp => CauSeq.nonneg_equiv h hp, fun hp => CauSeq.nonneg_equiv (Setoid.symm h) hp⟩)

instance : LE MyReal := ⟨fun x y => Nonneg (y - x)⟩

theorem lt_def (x y : MyReal) : (x < y) = IsPos (y - x) := rfl
theorem le_def (x y : MyReal) : (x ≤ y) = Nonneg (y - x) := rfl

theorem sub_self (x : MyReal) : x - x = 0 := by
  induction x using MyReal.ind with | _ f hf =>
  rw [sub_mk, zero_def]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.add_neg_cancel _))

theorem sub_zero (x : MyReal) : x - 0 = x := by
  induction x using MyReal.ind with | _ f hf =>
  rw [zero_def, sub_mk]
  refine eq_of_equiv (equiv_of_eq (fun n => ?_))
  simp only [constSeq]
  rw [MyRat.neg_zero, MyRat.add_zero]

theorem lt_irrefl (x : MyReal) : ¬ x < x := by
  rw [lt_def, sub_self]
  intro h
  obtain ⟨q, hq, N, hN⟩ := h
  have hle := hN N (Nat.le_refl N)
  simp only [constSeq] at hle
  exact absurd (MyRat.lt_of_le_of_lt hle hq) (MyRat.lt_irrefl q)

/-- Positivity is closed under addition (lifted from `CauSeq.pos_add`). -/
theorem IsPos_add {a b : MyReal} (ha : IsPos a) (hb : IsPos b) : IsPos (a + b) := by
  induction a using MyReal.ind with | _ f hf =>
  induction b using MyReal.ind with | _ g hg =>
  have ha' : CauSeq.Pos ⟨f, hf⟩ := ha
  have hb' : CauSeq.Pos ⟨g, hg⟩ := hb
  rw [add_mk]
  exact CauSeq.pos_add ha' hb'

theorem add_sub_add_telescope (x y z : MyReal) : (z - y) + (y - x) = z - x := by
  induction x using MyReal.ind with | _ f hf =>
  induction y using MyReal.ind with | _ g hg =>
  induction z using MyReal.ind with | _ h hh =>
  rw [sub_mk, sub_mk, add_mk, sub_mk]
  exact eq_of_equiv (equiv_of_eq (fun n => MyRat.telescope _ _ _))

theorem lt_trans {x y z : MyReal} (hxy : x < y) (hyz : y < z) : x < z := by
  rw [lt_def] at *
  have h := IsPos_add hyz hxy
  rwa [add_sub_add_telescope] at h

instance : Trans (· < · : MyReal → MyReal → Prop) (· < ·) (· < ·) := ⟨lt_trans⟩

/-- `≤` is reflexive. -/
theorem le_refl (x : MyReal) : x ≤ x := by
  rw [le_def, sub_self]
  intro ε hε
  exact ⟨0, fun n _ => by simp only [constSeq]; exact MyRat.neg_nonpos_of_pos hε⟩

/-- A positive real is nonnegative; hence `<` implies `≤`. -/
theorem Nonneg_of_IsPos {z : MyReal} (h : IsPos z) : Nonneg z := by
  induction z using MyReal.ind with | _ f hf =>
  exact CauSeq.nonneg_of_pos h

theorem le_of_lt {x y : MyReal} (h : x < y) : x ≤ y := by
  rw [le_def]; rw [lt_def] at h; exact Nonneg_of_IsPos h

/-- Nonnegativity is closed under addition (lifted from `CauSeq.nonneg_add`). -/
theorem Nonneg_add {a b : MyReal} (ha : Nonneg a) (hb : Nonneg b) : Nonneg (a + b) := by
  induction a using MyReal.ind with | _ f hf =>
  induction b using MyReal.ind with | _ g hg =>
  have ha' : CauSeq.Nonneg ⟨f, hf⟩ := ha
  have hb' : CauSeq.Nonneg ⟨g, hg⟩ := hb
  rw [add_mk]
  exact CauSeq.nonneg_add ha' hb'

theorem le_trans {x y z : MyReal} (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z := by
  rw [le_def] at *
  have h := Nonneg_add hyz hxy
  rwa [add_sub_add_telescope] at h

instance : Trans (· ≤ · : MyReal → MyReal → Prop) (· ≤ ·) (· ≤ ·) := ⟨le_trans⟩

/-- A real with an eventually-nonnegative representative is `≥ 0`. -/
theorem nonneg_of_eventually {f : ℕ → MyRat} {hf : IsCauchy f}
    (h : ∀ n, 0 ≤ f n) : (0 : MyReal) ≤ mk f hf := by
  rw [le_def, sub_zero]
  intro ε hε
  exact ⟨0, fun n _ => MyRat.le_trans (MyRat.neg_nonpos_of_pos hε) (h n)⟩

end MyReal
end Analysis
