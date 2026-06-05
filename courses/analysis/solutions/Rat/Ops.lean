/-
Infrastructure (given): with well-definedness proved, every operation descends
to the quotient `MyRat`. This module installs the instances (`+ - * ⁻¹ / < ≤ |·|`,
`0`, `1`) and the computation lemmas that rewrite an operation on `mk`s into a
single `mk`. From here on, exercises work entirely through this API and never
touch the quotient directly. There is no exercise here.
-/
import WellDef.le_imp

namespace Analysis
namespace MyRat

instance : Add MyRat :=
  ⟨Quotient.lift₂ (fun x y => Quotient.mk _ (PreRat.add x y))
    (fun _ _ _ _ hac hbd => Quotient.sound (PreRat.add_resp hac hbd))⟩

instance : Mul MyRat :=
  ⟨Quotient.lift₂ (fun x y => Quotient.mk _ (PreRat.mul x y))
    (fun _ _ _ _ hac hbd => Quotient.sound (PreRat.mul_resp hac hbd))⟩

instance : Neg MyRat :=
  ⟨Quotient.lift (fun x => Quotient.mk _ (PreRat.neg x))
    (fun _ _ hab => Quotient.sound (PreRat.neg_resp hab))⟩

instance : Abs MyRat :=
  ⟨Quotient.lift (fun x => Quotient.mk _ (PreRat.absAux x))
    (fun _ _ hab => Quotient.sound (PreRat.abs_resp hab))⟩

instance : Inv MyRat :=
  ⟨Quotient.lift (fun x => Quotient.mk _ (PreRat.invAux x))
    (fun _ _ hab => Quotient.sound (PreRat.inv_resp hab))⟩

instance : Zero MyRat := ⟨mk 0 1 (by omega)⟩
instance : One MyRat := ⟨mk 1 1 (by omega)⟩

instance : LT MyRat :=
  ⟨Quotient.lift₂ PreRat.ltAux
    (fun _ _ _ _ hac hbd =>
      propext ⟨PreRat.lt_imp hac hbd, PreRat.lt_imp (Setoid.symm hac) (Setoid.symm hbd)⟩)⟩

instance : LE MyRat :=
  ⟨Quotient.lift₂ PreRat.leAux
    (fun _ _ _ _ hac hbd =>
      propext ⟨PreRat.le_imp hac hbd, PreRat.le_imp (Setoid.symm hac) (Setoid.symm hbd)⟩)⟩

/-- Subtraction: `a - b = a + (-b)`. -/
instance : Sub MyRat := ⟨fun a b => a + (-b)⟩
/-- Division: `a / b = a * b⁻¹`. -/
instance : Div MyRat := ⟨fun a b => a * b⁻¹⟩

/-- The rational `n / 1` coming from an integer `n`. -/
def ofInt (n : Int) : MyRat := mk n 1 (by omega)

instance : DecidableEq MyRat :=
  Quotient.decidableEq
    (d := fun a b => inferInstanceAs (Decidable (a.num * b.den = b.num * a.den)))

/-! ### Computation lemmas: how the operations act on `mk`. -/

theorem add_mk {a b c d : Int} (hb : 0 < b) (hd : 0 < d) :
    mk a b hb + mk c d hd = mk (a * d + c * b) (b * d) (Int.mul_pos hb hd) := rfl

theorem mul_mk {a b c d : Int} (hb : 0 < b) (hd : 0 < d) :
    mk a b hb * mk c d hd = mk (a * c) (b * d) (Int.mul_pos hb hd) := rfl

theorem neg_mk {a b : Int} (hb : 0 < b) : -mk a b hb = mk (-a) b hb := rfl

theorem abs_mk {a b : Int} (hb : 0 < b) : |mk a b hb| = mk (a.natAbs : Int) b hb := rfl

theorem sub_mk {a b c d : Int} (hb : 0 < b) (hd : 0 < d) :
    mk a b hb - mk c d hd = mk (a * d + (-c) * b) (b * d) (Int.mul_pos hb hd) := rfl

theorem lt_mk {a b c d : Int} (hb : 0 < b) (hd : 0 < d) :
    (mk a b hb < mk c d hd) ↔ a * d < c * b := Iff.rfl

theorem le_mk {a b c d : Int} (hb : 0 < b) (hd : 0 < d) :
    (mk a b hb ≤ mk c d hd) ↔ a * d ≤ c * b := Iff.rfl

theorem zero_def : (0 : MyRat) = mk 0 1 (by omega) := rfl
theorem one_def : (1 : MyRat) = mk 1 1 (by omega) := rfl
theorem ofInt_def (n : Int) : ofInt n = mk n 1 (by omega) := rfl

/-- The reciprocal of a nonzero fraction, in closed form. -/
theorem inv_mk_of_ne {a b : Int} (hb : 0 < b) (ha : a ≠ 0) :
    (mk a b hb)⁻¹ =
      mk (a.sign * b) (a.natAbs : Int) (by have := Int.natAbs_pos.mpr ha; omega) := by
  apply Quotient.sound
  show PreRat.r _ _
  unfold PreRat.invAux
  rw [dif_neg ha]
  rfl

theorem div_mk {a b c d : Int} (hb : 0 < b) (hd : 0 < d) :
    mk a b hb / mk c d hd = mk a b hb * (mk c d hd)⁻¹ := rfl

end MyRat
end Analysis
