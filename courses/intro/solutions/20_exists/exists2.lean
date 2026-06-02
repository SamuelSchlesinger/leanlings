theorem exists_relabel (h : ∃ n : Nat, n + n = 10) : ∃ m : Nat, m + m = 10 := by
  let ⟨n, hn⟩ := h
  exact ⟨n, hn⟩

theorem exists_succ_gt_one (h : ∃ n : Nat, n > 0) : ∃ m : Nat, m > 1 := by
  let ⟨n, hn⟩ := h
  exact ⟨n + 1, by omega⟩
