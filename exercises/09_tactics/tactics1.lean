/- # Tactics 1: intro and exact

  Instead of writing proof terms directly, you can use
  tactic mode with `by`:

    theorem foo : P → P := by
      intro h    -- introduces hypothesis `h : P`
      exact h    -- closes the goal with `h`

  • `intro h` moves the hypothesis from the goal into context
  • `exact term` closes the goal when `term` has the right type

  TODO: Complete the proofs using `intro` and `exact`.
-/

-- Introduce the hypothesis, then provide it as the proof
theorem self_implication (P : Prop) : P → P := by
  sorry

-- Introduce both hypotheses, then use the right one
theorem use_second (P Q : Prop) : P → Q → Q := by
  sorry

-- Function composition
theorem compose (P Q R : Prop) : (P → Q) → (Q → R) → P → R := by
  sorry
