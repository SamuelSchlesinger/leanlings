/-
Infrastructure (given): once you have proved `r` is an equivalence relation, we
can form the quotient. This module assembles the `Setoid`, the type `MyRat`, and
the learner-facing API (`mk`, `ind`, `mk_eq`) used throughout the rest of the
course. There is no exercise here.
-/
import Setoid.r_trans

namespace Analysis

instance PreRat.setoid : Setoid PreRat :=
  ⟨PreRat.r, PreRat.r_refl, fun {_ _} => PreRat.r_symm, fun {_ _ _} => PreRat.r_trans⟩

/-- The rational numbers: fractions up to cross-multiplication. -/
def MyRat := Quotient PreRat.setoid

namespace MyRat

/-- The fraction `n / d`, for `h : 0 < d`. -/
def mk (n d : Int) (h : 0 < d) : MyRat := Quotient.mk PreRat.setoid ⟨n, d, h⟩

/-- Every rational is of the form `mk n d h`. Use with `induction x using MyRat.ind`. -/
@[elab_as_elim]
theorem ind {motive : MyRat → Prop}
    (H : ∀ (n d : Int) (h : 0 < d), motive (mk n d h)) (x : MyRat) : motive x :=
  Quotient.ind (fun p => H p.num p.den p.den_pos) x

/-- Two fractions are equal exactly when they cross-multiply equal. -/
theorem mk_eq {a b c d : Int} {hb : 0 < b} {hd : 0 < d} :
    mk a b hb = mk c d hd ↔ a * d = c * b :=
  ⟨fun h => Quotient.exact h, fun h => Quotient.sound h⟩

end MyRat
end Analysis
