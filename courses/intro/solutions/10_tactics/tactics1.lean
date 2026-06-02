theorem self_implication (P : Prop) : P → P := by
  intro h
  exact h

theorem use_second (P Q : Prop) : P → Q → Q := by
  intro _hp
  intro hq
  exact hq

theorem compose (P Q R : Prop) : (P → Q) → (Q → R) → P → R := by
  intro hpq hqr hp
  exact hqr (hpq hp)
