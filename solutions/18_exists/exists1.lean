theorem exists_gt_five : ∃ n : Nat, n > 5 :=
  ⟨6, by omega⟩

theorem exists_double : ∃ n : Nat, n + n = 10 :=
  ⟨5, by omega⟩

theorem exists_greater (n : Nat) : ∃ m : Nat, m > n :=
  ⟨n + 1, by omega⟩
