theorem calc_ineq (a b c : Nat) (h1 : a ≤ b) (h2 : b ≤ c) : a ≤ c := by
  calc a
      _ ≤ b := h1
      _ ≤ c := h2

theorem calc_mixed (a b : Nat) (h : a ≤ b) : a ≤ b + 1 := by
  calc a
      _ ≤ b := h
      _ ≤ b + 1 := by omega

theorem calc_strict (n : Nat) : n < n + 2 := by
  calc n
      _ < n + 1 := by omega
      _ < n + 2 := by omega
