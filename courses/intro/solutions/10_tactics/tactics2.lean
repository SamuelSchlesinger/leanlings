theorem apply_example (P Q : Prop) (hp : P) (f : P → Q) : Q := by
  apply f
  exact hp

theorem and_intro (P Q : Prop) (hp : P) (hq : Q) : P ∧ Q := by
  constructor
  · exact hp
  · exact hq

theorem and_swap (P Q : Prop) (h : P ∧ Q) : Q ∧ P := by
  constructor
  · exact h.right
  · exact h.left

theorem and_map (P Q R : Prop) (h : P ∧ Q) (f : Q → R) : P ∧ R := by
  constructor
  · exact h.left
  · apply f
    exact h.right
