theorem rewrite_example (a b : Nat) (h : a = b) : a + 1 = b + 1 := by
  rw [h]

theorem rewrite_chain (a b c : Nat) (h1 : a = b) (h2 : b = c) : a = c := by
  rw [h1, h2]

theorem rewrite_back (a b : Nat) (h : a = b) : b + 1 = a + 1 := by
  rw [← h]
