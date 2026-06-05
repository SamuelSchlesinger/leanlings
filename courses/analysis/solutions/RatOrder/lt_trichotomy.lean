import RatOrder.lt_trans
namespace Analysis
open MyRat
theorem MyRat.lt_trichotomy (x y : MyRat) : x < y ∨ x = y ∨ y < x := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  simp only [lt_mk, mk_eq]; omega
end Analysis
