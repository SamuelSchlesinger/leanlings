/- # Tactics 3: rewrite (rw)

  `rw [h]` rewrites the goal using an equation `h : a = b`,
  replacing `a` with `b`.

  `rw [← h]` rewrites backwards, replacing `b` with `a`.
  (Type ← as \l or \left)

  You can chain rewrites: `rw [h1, h2, h3]`

  TODO: Complete the proofs using `rw`.
-/

-- Rewrite using the hypothesis
theorem rewrite_example (a b : Nat) (h : a = b) : a + 1 = b + 1 := by
  sorry

-- Chain two rewrites
theorem rewrite_chain (a b c : Nat) (h1 : a = b) (h2 : b = c) : a = c := by
  sorry

-- Use backwards rewriting: replace b with a in the goal
theorem rewrite_back (a b : Nat) (h : a = b) : b + 1 = a + 1 := by
  sorry
