import RatOrder.le_trans
namespace Analysis
open MyRat
theorem MyRat.add_lt_add_left {y z : MyRat} (x : MyRat) (h : y < z) : x + y < x + z := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  induction z using ind with | _ e f hf =>
  rw [add_mk, add_mk, lt_mk]
  rw [lt_mk] at h
  have key := Int.mul_lt_mul_of_pos_right h (Int.mul_pos hb hb)
  have e1 : (a * d + c * b) * (b * f) = a * d * (b * f) + c * f * (b * b) := by grind
  have e2 : (a * f + e * b) * (b * d) = a * d * (b * f) + e * d * (b * b) := by grind
  rw [e1, e2]; omega
end Analysis
