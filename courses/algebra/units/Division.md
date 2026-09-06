# Division names an existing operation

In this course, group division is defined by `a / b = a * b⁻¹`. The theorem
`div_eq` exposes that definition. It introduces no additional group law.

```lean
import AlgebraLib.Prelude
open Algebra
example {G : Type} [Group G] (a b : G) :
    (a / b) * 1 = a * b⁻¹ := by
  rw [div_eq, mul_one]
```

Use the same pattern in each exercise: expand division, group inverse pairs,
and use the group laws. You can often recognize a theorem you already proved
once the slash is gone.

All elements of a group have inverses. In the field unit, cancellation by a
field element will require evidence that it is nonzero. Keep those two
settings distinct when interpreting a familiar-looking formula.
