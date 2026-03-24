/- # Tactics 4: simp, omega, and decide

  Powerful automation tactics:

  • `simp` — simplifies using known lemmas and definitions
  • `omega` — solves linear arithmetic over Nat and Int
  • `decide` — proves decidable propositions by evaluation

  These can often close goals in one step!

  TODO: Complete the proofs using the appropriate tactic.
-/

-- `omega` handles linear arithmetic
theorem arith1 : 2 + 3 = 5 := by
  sorry

theorem arith2 (n : Nat) : n + 0 = n := by
  sorry

-- `simp` can simplify expressions
theorem simp_example (l : List Nat) : l ++ [] = l := by
  sorry

-- `decide` works for finite/decidable propositions
theorem decide_example : 2 < 5 := by
  sorry
