/- # Cases and Have 2: Intermediate Steps

  `have name : type := proof` introduces an intermediate result:

    theorem example (h : P ∧ Q) : Q ∧ P := by
      have hp : P := h.left
      have hq : Q := h.right
      exact ⟨hq, hp⟩

  This is useful for breaking complex proofs into steps.
  You can also use `have` with tactics:

    have hp : P := by exact h.left

  TODO: Use `have` to break these proofs into steps.
-/

-- Chain implications using intermediate steps
theorem chain (P Q R : Prop) (hpq : P → Q) (hqr : Q → R) (hp : P) : R := by
  sorry

-- Use have to establish an intermediate fact
theorem double_neg_intro (P : Prop) (hp : P) : ¬¬P := by
  sorry
