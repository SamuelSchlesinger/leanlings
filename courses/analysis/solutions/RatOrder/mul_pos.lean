import RatOrder.add_le_add_left
namespace Analysis
open MyRat
theorem MyRat.mul_pos {x y : MyRat} (hx : 0 < x) (hy : 0 < y) : 0 < x * y := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  rw [zero_def, lt_mk] at hx hy
  rw [mul_mk, zero_def, lt_mk]
  have ha : 0 < a := by omega
  have hc : 0 < c := by omega
  have hac := Int.mul_pos ha hc
  omega
end Analysis
