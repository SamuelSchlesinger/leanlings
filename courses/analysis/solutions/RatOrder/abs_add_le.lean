import RatOrder.abs_mul
namespace Analysis
open MyRat
theorem MyRat.abs_add_le (x y : MyRat) : |x + y| ≤ |x| + |y| := by
  induction x using ind with | _ a b hb =>
  induction y using ind with | _ c d hd =>
  rw [add_mk, abs_mk, abs_mk, abs_mk, add_mk, le_mk]
  have key : ((a * d + c * b).natAbs : Int) ≤ (a.natAbs : Int) * d + (c.natAbs : Int) * b := by
    have tri := Int.natAbs_add_le (a * d) (c * b)
    rw [Int.natAbs_mul, Int.natAbs_mul] at tri
    have hd' : (d.natAbs : Int) = d := by omega
    have hb' : (b.natAbs : Int) = b := by omega
    have tri' : ((a * d + c * b).natAbs : Int)
        ≤ ((a.natAbs * d.natAbs + c.natAbs * b.natAbs : Nat) : Int) := by exact_mod_cast tri
    push_cast at tri'
    rw [hd', hb'] at tri'
    exact tri'
  exact Int.mul_le_mul_of_nonneg_right key (Int.le_of_lt (Int.mul_pos hb hd))
end Analysis
