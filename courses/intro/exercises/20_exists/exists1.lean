/- # Existential Proofs 1: Witnesses

  Welcome back to proof mode! Quick refresher of tactics:
  • `rfl` — proves a = a
  • `intro h` — introduces a hypothesis
  • `exact e` — closes the goal with expression e
  • `simp` / `omega` — simplification / arithmetic

  Now for something new: existential quantification.

  `∃ x, P x` means "there exists an x such that P x holds."
  (Type ∃ as \exists or \ex)

  To prove it, provide a witness and a proof:
    ⟨witness, proof⟩

  Or in tactic mode:
    exact ⟨witness, proof⟩
    -- or --
    use witness  -- then prove P witness

  TODO: Prove these existential statements.
-/

-- There exists a natural number greater than 5
theorem exists_gt_five : ∃ n : Nat, n > 5 := sorry

-- There exists a natural number whose double is 10
theorem exists_double : ∃ n : Nat, n + n = 10 := sorry

-- For any n, there exists a number greater than n
theorem exists_greater (n : Nat) : ∃ m : Nat, m > n := sorry
