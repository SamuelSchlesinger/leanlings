import RatOrder.abs_add_le
namespace Analysis
open MyRat
theorem MyRat.abs_lt {x y : MyRat} : |x| < y ↔ -y < x ∧ x < y := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  simp only [abs_mk, neg_mk, lt_mk, Int.neg_mul]
  by_cases h : 0 ≤ a
  · have hh : (a.natAbs : Int) * d = a * d := by
      have : (a.natAbs : Int) = a := by omega
      rw [this]
    rw [hh]
    have h2 : 0 ≤ a * d := Int.mul_nonneg h (Int.le_of_lt hd)
    omega
  · have hh : (a.natAbs : Int) * d = -(a * d) := by
      have : (a.natAbs : Int) = -a := by omega
      rw [this, Int.neg_mul]
    rw [hh]
    have h2 : a * d < 0 := Int.mul_neg_of_neg_of_pos (by omega) hd
    omega
end Analysis
