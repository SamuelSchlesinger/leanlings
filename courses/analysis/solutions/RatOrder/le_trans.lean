import RatOrder.le_refl
namespace Analysis
open MyRat
theorem MyRat.le_trans {x y z : MyRat} (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  induction z using ind with | _ e f hf =>
  rw [le_mk] at *
  have h1 := Int.mul_le_mul_of_nonneg_right hxy (Int.le_of_lt hf)
  have h2 := Int.mul_le_mul_of_nonneg_right hyz (Int.le_of_lt hb)
  have e3 : c * b * f = c * f * b := by grind
  rw [e3] at h1
  have h3 : a * d * f ≤ e * d * b := Int.le_trans h1 h2
  have e4 : a * d * f = a * f * d := by grind
  have e5 : e * d * b = e * b * d := by grind
  rw [e4, e5] at h3
  exact (Int.mul_le_mul_right hd).mp h3
end Analysis
