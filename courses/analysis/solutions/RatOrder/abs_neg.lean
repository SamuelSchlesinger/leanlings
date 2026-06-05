import RatOrder.abs_nonneg
namespace Analysis
open MyRat
theorem MyRat.abs_neg (x : MyRat) : |(-x)| = |x| := by
  induction x using ind with | _ a b hb =>
  rw [neg_mk, abs_mk, abs_mk, mk_eq, Int.natAbs_neg]
end Analysis
