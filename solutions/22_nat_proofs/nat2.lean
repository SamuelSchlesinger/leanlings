theorem my_le_trans (a b c : Nat) (h1 : a ≤ b) (h2 : b ≤ c) : a ≤ c := by
  omega

theorem add_le_add (a b c : Nat) (h : a ≤ b) : a + c ≤ b + c := by
  omega

theorem le_double (n : Nat) : n ≤ 2 * n := by
  omega

theorem le_antisymm' (a b : Nat) (h1 : a ≤ b) (h2 : b ≤ a) : a = b := by
  omega
