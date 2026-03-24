theorem exists_imp' (h : ∃ n : Nat, n + n = 10) : ∃ m : Nat, m = 5 := by
  let ⟨n, hn⟩ := h
  exact ⟨5, rfl⟩

theorem exists_add (h : ∃ n : Nat, n > 0) : ∃ m : Nat, m > 1 := by
  let ⟨n, hn⟩ := h
  exact ⟨n + 1, by omega⟩
