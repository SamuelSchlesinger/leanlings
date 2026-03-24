/- # Classical Logic 2: Contrapositive

  The contrapositive of `P → Q` is `¬Q → ¬P`.
  Proving the contrapositive is often easier.

  Constructively: `(P → Q) → (¬Q → ¬P)` is always provable.
  Classically: `(¬Q → ¬P) → (P → Q)` also holds (needs em).

  TODO: Prove both directions.
-/

-- Constructive direction (doesn't need classical logic)
theorem contrapositive (P Q : Prop) (h : P → Q) : ¬Q → ¬P := by
  sorry

-- Classical direction (needs excluded middle)
theorem contrapositive_reverse (P Q : Prop) (h : ¬Q → ¬P) : P → Q := by
  sorry

-- Apply contrapositive reasoning
theorem not_or_of_imp (P Q : Prop) (h : P → Q) : ¬P ∨ Q := by
  sorry
