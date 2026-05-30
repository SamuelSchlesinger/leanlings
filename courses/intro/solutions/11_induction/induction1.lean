def myAdd : Nat → Nat → Nat
  | n, 0     => n
  | n, m + 1 => (myAdd n m) + 1

theorem myAdd_zero (n : Nat) : myAdd n 0 = n := by
  rfl

theorem myAdd_zero_left (n : Nat) : myAdd 0 n = n := by
  induction n with
  | zero => rfl
  | succ n ih => simp [myAdd, ih]
