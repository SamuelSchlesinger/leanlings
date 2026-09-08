/- # Tactics 2: apply and constructor

  • `apply f` — if the goal is `B` and `f : A → B`,
    changes the goal to `A` (working backwards).

  • `constructor` — splits a goal `A ∧ B` into two subgoals.
    `And` has one constructor requiring a proof of each part.
    For a disjunction, the two constructors are alternatives: you must
    choose which side to prove, rather than prove both sides.

  Use a `·` bullet (type \cdot) to focus each subgoal:

    example (P : Prop) (hp : P) : P ∧ True := by
      constructor
      · exact hp
      · exact True.intro

  Each indented branch must finish its own goal. Here the first
  branch proves `P` and the second proves `True`.

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

-- Use constructor and the .left/.right accessors together
theorem and_swap (P Q : Prop) (h : P ∧ Q) : Q ∧ P := by
  sorry

-- Combine constructor and apply
theorem and_map (P Q R : Prop) (h : P ∧ Q) (f : Q → R) : P ∧ R := by
  sorry
