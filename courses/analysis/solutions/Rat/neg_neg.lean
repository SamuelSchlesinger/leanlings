import Rat.neg_add_cancel
namespace Analysis
open MyRat
theorem MyRat.neg_neg (x : MyRat) : - -x = x := by
  induction x using ind with | _ a b hb =>
  rw [neg_mk, neg_mk, mk_eq]; grind
end Analysis
