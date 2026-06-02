/- # Existential Proofs 2: Destructuring

  Given `h : ∃ x, P x`, extract the witness with:
  • `let ⟨w, hw⟩ := h` — gives you w and hw : P w
  • `match h with | ⟨w, hw⟩ => ...`
  • In tactic mode: `cases h with | intro w hw => ...`

  TODO: Prove these by destructuring existential hypotheses.
-/

-- If there exists an even number in some property, we can extract it
theorem exists_imp' (h : ∃ n : Nat, n + n = 10) : ∃ m : Nat, m = 5 := by
  sorry

-- Existentials compose
theorem exists_add (h : ∃ n : Nat, n > 0) : ∃ m : Nat, m > 1 := by
  sorry
