import RatOrder.abs_lt
namespace Analysis
open MyRat
theorem MyRat.archimedean (x : MyRat) : ∃ n : Nat, x < ofInt (n : Int) := by
  induction x using ind with | _ a b hb =>
  refine ⟨a.natAbs + 1, ?_⟩
  rw [ofInt_def, lt_mk]
  have step : ((a.natAbs : Int) + 1) * 1 ≤ ((a.natAbs : Int) + 1) * b :=
    Int.mul_le_mul_of_nonneg_left (by omega) (by omega)
  push_cast
  omega
end Analysis
