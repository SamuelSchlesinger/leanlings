import RatOrder.archimedean
namespace Analysis
open MyRat
theorem MyRat.exists_between {x y : MyRat} (h : x < y) : ∃ z : MyRat, x < z ∧ z < y := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  rw [lt_mk] at h
  -- the midpoint (a*d + c*b) / (2*b*d) lies strictly between
  refine ⟨mk (a * d + c * b) (2 * (b * d)) (by have := Int.mul_pos hb hd; omega), ?_, ?_⟩
  · rw [lt_mk]
    have key := Int.mul_lt_mul_of_pos_right h hb
    have ek : a * d * b = a * b * d := by grind
    rw [ek] at key
    have e1 : a * (2 * (b * d)) = a * b * d + a * b * d := by grind
    have e2 : (a * d + c * b) * b = a * b * d + c * b * b := by grind
    rw [e1, e2]; omega
  · rw [lt_mk]
    have key := Int.mul_lt_mul_of_pos_right h hd
    have e1 : (a * d + c * b) * d = a * d * d + c * b * d := by grind
    have e2 : c * (2 * (b * d)) = c * b * d + c * b * d := by grind
    rw [e1, e2]; omega
end Analysis
