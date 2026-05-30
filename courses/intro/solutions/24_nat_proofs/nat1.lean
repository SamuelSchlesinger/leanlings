theorem my_add_comm (a b : Nat) : a + b = b + a := by
  omega

theorem my_add_assoc (a b c : Nat) : (a + b) + c = a + (b + c) := by
  omega

theorem add_zero_both (n : Nat) : 0 + n = n ∧ n + 0 = n := by
  constructor <;> omega
