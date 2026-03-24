/- # Propositions 3: Negation and Implication

  • `A → B` (implication): a function from proof of A to proof of B.
    Proved by `fun (h : A) => ...proof of B...`

  • `¬A` (negation): defined as `A → False`.
    To prove ¬A, assume A and derive a contradiction.

  • `absurd : α → ¬α → β` derives anything from a contradiction.

  TODO: Provide proofs for each theorem.
-/

-- Implication: if we know P, we can prove P
theorem identity (P : Prop) : P → P :=
  sorry

-- If we know P and P → Q, we can prove Q
theorem modus_ponens (P Q : Prop) : P → (P → Q) → Q :=
  sorry

-- From a contradiction (P and ¬P), we can prove anything
theorem contradiction (P Q : Prop) : P → ¬P → Q :=
  sorry
