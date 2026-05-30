theorem calc_trans (f : Nat → Nat)
    (h1 : f 0 ≤ f 1) (h2 : f 1 ≤ f 2) :
    f 0 ≤ f 2 := by
  calc f 0
      _ ≤ f 1 := by exact h1
      _ ≤ f 2 := by exact h2

theorem calc_mixed (a b c : Nat) (h1 : a = b) (h2 : b ≤ c) :
    a ≤ c := by
  calc a
      _ = b := by rw [h1]
      _ ≤ c := by exact h2

theorem calc_three (f : Nat → Nat)
    (h1 : f 0 ≤ f 1) (h2 : f 1 ≤ f 2) (h3 : f 2 ≤ 100) :
    f 0 ≤ 100 := by
  calc f 0
      _ ≤ f 1 := h1
      _ ≤ f 2 := h2
      _ ≤ 100 := h3
