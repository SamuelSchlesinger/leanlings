/-
AnalysisLib.Rat: the raw material for building the rational numbers ℚ.

We take core Lean's integers `Int` as given (they come with `omega`) and will
build ℚ as a quotient: a rational is a fraction `n / d` with `d > 0`, and two
fractions are identified when they cross-multiply equal (`a/b = c/d ↔ a*d = c*b`).

This file provides only the pieces that do *not* depend on facts you will prove:

* the `PreRat` representatives and the relation `r` on them;
* the operations on representatives (`add`, `mul`, `neg`, `absAux`, `invAux`,
  `ltAux`, `leAux`) — note these are *definitions*, nothing is proved about them;
* the two fiddliest well-definedness lemmas, `abs_resp` and `inv_resp` (the sign
  and `natAbs` bookkeeping), which would distract from the main ideas.

You will prove the rest:

* that `r` is an equivalence relation (the `Setoid` world), and
* that `+`, `×`, `-`, `<`, `≤` respect `r` so they descend to the quotient
  (the `WellDef` world).

The infrastructure modules `Rat.Quotient` and `Rat.Ops` then assemble the
quotient type `MyRat`, its operations, and the learner-facing API from your
proofs, and the remaining worlds develop the theory.
-/

namespace Analysis

/-- `ℕ` abbreviates core Lean's `Nat` (core Lean has no `ℕ` notation of its own).
Sequences in this course are indexed by `ℕ`. -/
notation "ℕ" => Nat

/-- A tiny absolute-value class, since core Lean has none. `|x|` means `Abs.abs x`. -/
class Abs (α : Type _) where
  /-- The absolute value of `x`, written `|x|`. -/
  abs : α → α

/-- `|x|` is `Abs.abs x`. The `noWs` guards (no whitespace next to the bars) keep
this from clashing with the `|` that separates `match`/`fun` arms — so write
`|x|`, not `| x |`. -/
macro:max atomic("|" noWs) x:term noWs "|" : term => `(Abs.abs $x)

/-! ### Fractions: the pre-quotient representatives -/

/-- A fraction `num / den` with a positive denominator. -/
structure PreRat where
  num : Int
  den : Int
  den_pos : 0 < den

namespace PreRat

/-- Two fractions represent the same rational when they cross-multiply equal. -/
def r (a b : PreRat) : Prop := a.num * b.den = b.num * a.den

theorem r_iff {a b : PreRat} : r a b ↔ a.num * b.den = b.num * a.den := Iff.rfl

/-! Operations on representatives. (Definitions only — you prove their laws.) -/

def add (x y : PreRat) : PreRat :=
  ⟨x.num * y.den + y.num * x.den, x.den * y.den, Int.mul_pos x.den_pos y.den_pos⟩

def mul (x y : PreRat) : PreRat :=
  ⟨x.num * y.num, x.den * y.den, Int.mul_pos x.den_pos y.den_pos⟩

def neg (x : PreRat) : PreRat := ⟨-x.num, x.den, x.den_pos⟩

def absAux (x : PreRat) : PreRat := ⟨(x.num.natAbs : Int), x.den, x.den_pos⟩

/-- Reciprocal: `(n/d)⁻¹ = (sign n · d) / |n|`, and `0⁻¹ = 0` by convention. -/
def invAux (x : PreRat) : PreRat :=
  if h : x.num = 0 then ⟨0, 1, by omega⟩
  else ⟨x.num.sign * x.den, (x.num.natAbs : Int), by have := Int.natAbs_pos.mpr h; omega⟩

/-- The strict order on representatives. -/
def ltAux (x y : PreRat) : Prop := x.num * y.den < y.num * x.den

/-- The non-strict order on representatives. -/
def leAux (x y : PreRat) : Prop := x.num * y.den ≤ y.num * x.den

/-! The two well-definedness lemmas kept in the library (sign / `natAbs` work). -/

/-- Absolute value respects `r`. -/
theorem abs_resp {a b : PreRat} (hab : r a b) : r (absAux a) (absAux b) := by
  have h : a.num * b.den = b.num * a.den := hab
  show (a.num.natAbs : Int) * b.den = (b.num.natAbs : Int) * a.den
  have hb : (b.den.natAbs : Int) = b.den := by have := b.den_pos; omega
  have ha : (a.den.natAbs : Int) = a.den := by have := a.den_pos; omega
  have hn : ((a.num * b.den).natAbs : Int) = ((b.num * a.den).natAbs : Int) := by rw [h]
  rw [Int.natAbs_mul, Int.natAbs_mul] at hn
  push_cast at hn
  rw [hb, ha] at hn
  exact hn

/-- The reciprocal respects `r`. -/
theorem inv_resp {a b : PreRat} (hab : r a b) : r (invAux a) (invAux b) := by
  have h : a.num * b.den = b.num * a.den := hab
  have hap := a.den_pos; have hbp := b.den_pos
  have hz : a.num = 0 ↔ b.num = 0 := by
    constructor <;> intro hh
    · rw [hh, Int.zero_mul] at h
      rcases Int.mul_eq_zero.mp h.symm with h' | h'
      · exact h'
      · omega
    · rw [hh, Int.zero_mul] at h
      rcases Int.mul_eq_zero.mp h with h' | h'
      · exact h'
      · omega
  unfold invAux
  by_cases ha0 : a.num = 0
  · rw [dif_pos ha0, dif_pos (hz.mp ha0)]; rfl
  · rw [dif_neg ha0, dif_neg (fun hb0 => ha0 (hz.mpr hb0))]
    show a.num.sign * a.den * (b.num.natAbs : Int) = b.num.sign * b.den * (a.num.natAbs : Int)
    have sa := Int.sign_mul_natAbs a.num
    have sb := Int.sign_mul_natAbs b.num
    grind

end PreRat
end Analysis
