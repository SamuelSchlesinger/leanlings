import Rat.Ops

namespace Analysis
open MyRat

/- # Rat world — the field laws of ℚ

`Rat.Ops` now gives every operation on `MyRat`, plus the API you will use
constantly:

  • `induction x using MyRat.ind with | _ a b hb =>`  replaces a rational `x`
     by a concrete fraction `mk a b hb` (with `hb : 0 < b`);
  • computation lemmas rewrite operations on `mk`s:
     `add_mk`, `mul_mk`, `neg_mk`, `sub_mk`, `zero_def`, `one_def`;
  • `mk_eq : mk a b hb = mk c d hd ↔ a * d = c * b` turns an equation of
     rationals into one of integers, which `grind` then closes.

THE PATTERN (used in almost every Rat-world level):

    induction x using MyRat.ind with | _ a b hb =>
    induction y using MyRat.ind with | _ c d hd =>
    rw [add_mk, add_mk, mk_eq]
    grind

Prove commutativity of addition with it. -/
theorem MyRat.add_comm (x y : MyRat) : x + y = y + x := by
  sorry

end Analysis
