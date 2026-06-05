/-
Infrastructure (given): the real numbers, as a quotient of Cauchy sequences of
rationals. `CauSeq` packages a sequence with a proof that it is Cauchy; two are
identified when their difference tends to `0` (the `CauchyEquiv` relation you
showed is an equivalence). `MyReal` is the quotient.

This module installs the additive structure (`+`, `-`, `0`, `1`), the embedding
`ofRat : MyRat → MyReal`, and a learner-facing API mirroring the `MyRat` one:

  • `MyReal.mk f hf`           a real from a Cauchy sequence;
  • `MyReal.ind`               every real is `mk f hf`;
  • `MyReal.add_mk`, `neg_mk`  computation lemmas;
  • `MyReal.eq_of_equiv`       equal-in-the-quotient from `CauchyEquiv`;
  • `MyReal.equiv_of_eq`       `CauchyEquiv` from pointwise equality.

Multiplication, order, and the inverse arrive in later infrastructure modules.
-/
import Cauchy.Mul

namespace Analysis
open MyRat

/-- A Cauchy sequence of rationals, bundled with its Cauchy proof. -/
structure CauSeq where
  seq : ℕ → MyRat
  is_cauchy : IsCauchy seq

namespace CauSeq

/-- Two Cauchy sequences are equivalent when their difference tends to `0`. -/
def Equiv (f g : CauSeq) : Prop := CauchyEquiv f.seq g.seq

instance setoid : Setoid CauSeq :=
  ⟨Equiv,
   fun f => equiv_refl f.seq,
   fun {_ _} h => equiv_symm h,
   fun {_ _ _} h1 h2 => equiv_trans h1 h2⟩

def add (f g : CauSeq) : CauSeq := ⟨fun n => f.seq n + g.seq n, add_isCauchy f.is_cauchy g.is_cauchy⟩
def neg (f : CauSeq) : CauSeq := ⟨fun n => -f.seq n, neg_isCauchy f.is_cauchy⟩

theorem add_equiv {f f' g g' : CauSeq} (hf : f ≈ f') (hg : g ≈ g') : add f g ≈ add f' g' := by
  have hf' : CauchyEquiv f.seq f'.seq := hf
  have hg' : CauchyEquiv g.seq g'.seq := hg
  intro ε hε
  obtain ⟨δ, hδ, hδδ⟩ := MyRat.exists_half hε
  obtain ⟨N1, hN1⟩ := hf' δ hδ
  obtain ⟨N2, hN2⟩ := hg' δ hδ
  refine ⟨Nat.max N1 N2, fun n hn => ?_⟩
  have h1 := hN1 n (Nat.le_trans (Nat.le_max_left _ _) hn)
  have h2 := hN2 n (Nat.le_trans (Nat.le_max_right _ _) hn)
  show |(f.seq n + g.seq n) - (f'.seq n + g'.seq n)| < ε
  calc |(f.seq n + g.seq n) - (f'.seq n + g'.seq n)|
      = |(f.seq n - f'.seq n) + (g.seq n - g'.seq n)| := by rw [MyRat.add_sub_add]
    _ ≤ |f.seq n - f'.seq n| + |g.seq n - g'.seq n| := MyRat.abs_add_le _ _
    _ < δ + δ := MyRat.add_lt_add h1 h2
    _ = ε := hδδ

theorem neg_equiv {f f' : CauSeq} (hf : f ≈ f') : neg f ≈ neg f' := by
  have hf' : CauchyEquiv f.seq f'.seq := hf
  intro ε hε
  obtain ⟨N, hN⟩ := hf' ε hε
  refine ⟨N, fun n hn => ?_⟩
  show |(-f.seq n) - (-f'.seq n)| < ε
  rw [MyRat.neg_sub_neg, MyRat.abs_sub_comm]
  exact hN n hn

end CauSeq

/-- The real numbers: Cauchy sequences of rationals, up to `CauchyEquiv`. -/
def MyReal := Quotient CauSeq.setoid

namespace MyReal

/-- The real represented by a Cauchy sequence `f`. -/
def mk (f : ℕ → MyRat) (hf : IsCauchy f) : MyReal := Quotient.mk _ ⟨f, hf⟩

/-- Every real is `mk f hf` for some Cauchy `f`. Use with `induction x using MyReal.ind`. -/
@[elab_as_elim]
theorem ind {motive : MyReal → Prop}
    (H : ∀ (f : ℕ → MyRat) (hf : IsCauchy f), motive (mk f hf)) (x : MyReal) : motive x :=
  Quotient.ind (fun s => H s.seq s.is_cauchy) x

instance : Add MyReal :=
  ⟨Quotient.lift₂ (fun f g => Quotient.mk _ (CauSeq.add f g))
    (fun _ _ _ _ h1 h2 => Quotient.sound (CauSeq.add_equiv h1 h2))⟩

instance : Neg MyReal :=
  ⟨Quotient.lift (fun f => Quotient.mk _ (CauSeq.neg f))
    (fun _ _ h => Quotient.sound (CauSeq.neg_equiv h))⟩

instance : Sub MyReal := ⟨fun a b => a + (-b)⟩
instance : Zero MyReal := ⟨Quotient.mk _ ⟨constSeq 0, const_isCauchy 0⟩⟩
instance : One MyReal := ⟨Quotient.mk _ ⟨constSeq 1, const_isCauchy 1⟩⟩

/-- The embedding of `ℚ` into `ℝ` as a constant sequence. -/
def ofRat (q : MyRat) : MyReal := Quotient.mk _ ⟨constSeq q, const_isCauchy q⟩

theorem add_mk (f g : ℕ → MyRat) (hf : IsCauchy f) (hg : IsCauchy g) :
    mk f hf + mk g hg = mk (fun n => f n + g n) (add_isCauchy hf hg) := rfl

theorem neg_mk (f : ℕ → MyRat) (hf : IsCauchy f) :
    -mk f hf = mk (fun n => -f n) (neg_isCauchy hf) := rfl

theorem sub_mk (f g : ℕ → MyRat) (hf : IsCauchy f) (hg : IsCauchy g) :
    mk f hf - mk g hg = mk (fun n => f n + -g n) (add_isCauchy hf (neg_isCauchy hg)) := rfl

theorem zero_def : (0 : MyReal) = mk (constSeq 0) (const_isCauchy 0) := rfl
theorem one_def : (1 : MyReal) = mk (constSeq 1) (const_isCauchy 1) := rfl
theorem ofRat_def (q : MyRat) : ofRat q = mk (constSeq q) (const_isCauchy q) := rfl

/-- Two reals are equal if their representatives are `CauchyEquiv`. -/
theorem eq_of_equiv {f g : ℕ → MyRat} {hf : IsCauchy f} {hg : IsCauchy g}
    (h : CauchyEquiv f g) : mk f hf = mk g hg := Quotient.sound h

/-- Pointwise-equal sequences are `CauchyEquiv`. -/
theorem equiv_of_eq {f g : ℕ → MyRat} (h : ∀ n, f n = g n) : CauchyEquiv f g := by
  intro ε hε
  refine ⟨0, fun n _ => ?_⟩
  rw [h n, MyRat.sub_self, MyRat.abs_zero]
  exact hε

end MyReal
end Analysis
