theorem chain (P Q R : Prop) (hpq : P → Q) (hqr : Q → R) (hp : P) : R := by
  have hq : Q := hpq hp
  exact hqr hq

theorem double_neg_intro (P : Prop) (hp : P) : ¬¬P := by
  intro hn
  exact hn hp
