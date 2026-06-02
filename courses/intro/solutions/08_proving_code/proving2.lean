def double (n : Nat) : Nat := n + n

def triple (n : Nat) : Nat := 3 * n

theorem triple_0 : triple 0 = 0 := by
  rfl

theorem triple_def (n : Nat) : triple n = 3 * n := by
  rfl

theorem zero_add (n : Nat) : 0 + n = n := by
  omega

theorem double_add (a b : Nat) : double (a + b) = double a + double b := by
  simp [double]; omega
