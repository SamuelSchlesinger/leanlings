# An inequality has a witness

Here `a ≤ b` means `∃ c, b = a + c`: there is a natural-number gap from
`a` to `b`. To prove it, choose the gap. To use it, extract the gap and
its equation.

```lean
import AdvAddition.add_left_eq_zero
open MyNat
example (a b gap : ℕ) (h : b = a + gap) : a ≤ b := by
  exact ⟨gap, h⟩
```

`refine ⟨gap, ?_⟩` supplies the same witness and leaves its equation
as a goal. Use `obtain ⟨gap, hgap⟩ := h` to extract a witness from a hypothesis. For transitivity, extract two gaps and add them. For antisymmetry,
going forward and back gives a total gap of zero.

Totality requires a choice between `a ≤ b` and `b ≤ a`. A disjunction in
the goal needs one branch; a disjunction in a hypothesis requires both
cases. Read which side of the turnstile contains `∨` before choosing a tactic.
