def sumTo : Nat → Nat
  | 0 => 0
  | n + 1 => sumTo n + (n + 1)

theorem sumTo_formula (n : Nat) : 2 * sumTo n = n * (n + 1) := by
  induction n with
  | zero => simp [sumTo]
  | succ n ih =>
    simp [sumTo]
    rw [Nat.mul_add, ih, ← Nat.add_mul, Nat.mul_comm]

theorem sumTo_mono (n : Nat) : sumTo n ≤ sumTo (n + 1) := by
  simp [sumTo]
