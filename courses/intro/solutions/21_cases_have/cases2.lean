theorem zero_or_pos (n : Nat) : n = 0 ∨ n > 0 := by
  cases n with
  | zero => exact Or.inl rfl
  | succ m => exact Or.inr (by omega)

theorem bool_and_comm (a b : Bool) : (a && b) = (b && a) := by
  cases a <;> cases b <;> rfl
