theorem calc_example (a b c : Nat) (h1 : a = b + 1) (h2 : b = c + 2) :
    a = c + 3 := by
  calc a
      _ = b + 1 := h1
      _ = (c + 2) + 1 := by rw [h2]
      _ = c + 3 := by omega

theorem calc_arith (n : Nat) : (n + 1) * 2 = n * 2 + 2 := by
  calc (n + 1) * 2
      _ = n * 2 + 1 * 2 := by rw [Nat.add_mul]
      _ = n * 2 + 2 := by omega
