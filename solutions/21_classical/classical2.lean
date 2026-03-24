theorem contrapositive (P Q : Prop) (h : P → Q) : ¬Q → ¬P := by
  intro hnq hp
  exact hnq (h hp)

theorem contrapositive_reverse (P Q : Prop) (h : ¬Q → ¬P) : P → Q := by
  intro hp
  cases Classical.em Q with
  | inl hq => exact hq
  | inr hnq => exact absurd hp (h hnq)

theorem not_or_of_imp (P Q : Prop) (h : P → Q) : ¬P ∨ Q := by
  cases Classical.em P with
  | inl hp => exact Or.inr (h hp)
  | inr hnp => exact Or.inl hnp
