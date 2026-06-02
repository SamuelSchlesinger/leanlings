-- Term-mode proofs (as taught in this module):
theorem identity (P : Prop) : P → P :=
  fun h => h

theorem modus_ponens (P Q : Prop) : P → (P → Q) → Q :=
  fun hp hpq => hpq hp

theorem contradiction (P Q : Prop) : P → ¬P → Q :=
  fun hp hnp => absurd hp hnp

-- Alternative: tactic-mode proofs (taught in the next module):
-- theorem identity (P : Prop) : P → P := by
--   intro h; exact h
-- theorem modus_ponens (P Q : Prop) : P → (P → Q) → Q := by
--   intro hp hpq; exact hpq hp
-- theorem contradiction (P Q : Prop) : P → ¬P → Q := by
--   intro hp hnp; exact absurd hp hnp
