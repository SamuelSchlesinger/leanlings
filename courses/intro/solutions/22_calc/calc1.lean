theorem calc_rewrite (f : Nat → Nat) (h1 : f 0 = 3) (h2 : f 3 = 7) :
    f (f 0) = 7 := by
  calc f (f 0)
      _ = f 3 := by rw [h1]
      _ = 7   := by rw [h2]

theorem calc_chain (f g : Nat → Nat)
    (h1 : ∀ x, f x = g x + 1)
    (h2 : ∀ x, g x = x * 2) :
    f 5 = 11 := by
  calc f 5
      _ = g 5 + 1     := by rw [h1]
      _ = 5 * 2 + 1   := by rw [h2]
      _ = 11           := by rfl
