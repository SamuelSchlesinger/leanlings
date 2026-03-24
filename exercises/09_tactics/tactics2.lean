/- # Tactics 2: apply and constructor

  • `apply f` — if the goal is `B` and `f : A → B`,
    changes the goal to `A` (working backwards).

  • `constructor` — splits a goal `A ∧ B` into two subgoals.
    Also works for other multi-constructor types.

  TODO: Complete the proofs.
-/

-- Use `apply` to work backwards
theorem apply_example (P Q : Prop) (hp : P) (f : P → Q) : Q := by
  sorry

-- Use `constructor` to split ∧, then prove each part
theorem and_intro (P Q : Prop) (hp : P) (hq : Q) : P ∧ Q := by
  sorry

-- For the next theorem, you can access parts of `h : P ∧ Q`
-- using `h.left` (or `h.1`) and `h.right` (or `h.2`).

-- Combine constructor and apply
theorem and_swap (P Q : Prop) (h : P ∧ Q) : Q ∧ P := by
  sorry
