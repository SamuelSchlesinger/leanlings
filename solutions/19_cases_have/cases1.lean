theorem and_comm' (P Q : Prop) (h : P ∧ Q) : Q ∧ P := by
  cases h with
  | intro left right => exact ⟨right, left⟩

theorem or_comm' (P Q : Prop) (h : P ∨ Q) : Q ∨ P := by
  cases h with
  | inl hp => exact Or.inr hp
  | inr hq => exact Or.inl hq

theorem and_or_left' (P Q R : Prop) (h : P ∧ (Q ∨ R)) : (P ∧ Q) ∨ (P ∧ R) := by
  cases h with
  | intro hp hqr =>
    cases hqr with
    | inl hq => exact Or.inl ⟨hp, hq⟩
    | inr hr => exact Or.inr ⟨hp, hr⟩
