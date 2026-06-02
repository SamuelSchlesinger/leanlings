/- # Existential Proofs 2: Destructuring

  Given `h : ∃ x, P x`, pull the witness and its proof out of it:
  • `let ⟨w, hw⟩ := h`   -- now `w` is the witness and `hw : P w`

  Then use `w` (and `hw`) to build whatever the goal asks for.

  TODO: Prove these by destructuring the existential hypothesis.
-/

-- Pull the witness out of `h` and hand it back, together with its proof.
theorem exists_relabel (h : ∃ n : Nat, n + n = 10) : ∃ m : Nat, m + m = 10 := by
  sorry

-- Build a new witness from the old one: if `n > 0`, then `n + 1 > 1`.
theorem exists_succ_gt_one (h : ∃ n : Nat, n > 0) : ∃ m : Nat, m > 1 := by
  sorry
