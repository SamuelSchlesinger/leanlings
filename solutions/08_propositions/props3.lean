theorem identity (P : Prop) : P → P :=
  fun h => h

theorem modus_ponens (P Q : Prop) : P → (P → Q) → Q :=
  fun hp hpq => hpq hp

theorem contradiction (P Q : Prop) : P → ¬P → Q :=
  fun hp hnp => absurd hp hnp
