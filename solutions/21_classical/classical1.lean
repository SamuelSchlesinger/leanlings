theorem em_example (P : Prop) : P ∨ ¬P :=
  Classical.em P

theorem dne (P : Prop) (h : ¬¬P) : P := by
  exact Classical.byContradiction (fun hn => h hn)

theorem by_contradiction_example (P Q : Prop) (h : ¬P → Q) (hnq : ¬Q) : P := by
  exact Classical.byContradiction (fun hnp => hnq (h hnp))
