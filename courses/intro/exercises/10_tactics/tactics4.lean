/- # Tactics 4: simp, omega, and decide

  Powerful automation tactics that can close goals in one step:

  • `omega` — linear arithmetic over Nat and Int
    Use when: the goal is about +, -, ≤, <, = on numbers.

  • `simp` — simplifies using known lemmas and definitions
    Use when: the goal involves list/structure operations
    or needs rewriting with standard library facts.

  • `decide` — proves decidable propositions by evaluation
    Use when: the goal can be checked by trying all cases
    (e.g., comparisons of specific numbers, finite Bool logic).

  Each exercise below is labeled with the RIGHT tactic.
  Try using the WRONG one too — see what happens!

  TODO: Complete the proofs using the indicated tactic.
-/

-- Use `omega` — this is linear arithmetic
theorem arith1 : 2 + 3 = 5 := by
  sorry

-- Use `omega` — arithmetic with a variable
theorem arith2 (n : Nat) : n + 0 = n := by
  sorry

-- Use `simp` — this involves list operations, not arithmetic
theorem simp_example (l : List Nat) : l ++ [] = l := by
  sorry

-- Use `decide` — a concrete comparison (no variables)
theorem decide_example : 2 < 5 := by
  sorry
