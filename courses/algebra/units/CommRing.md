# Expanding without losing track

A **commutative ring** adds commutativity of multiplication to the ring laws.
This lets you rearrange the factors of each term in a polynomial identity.

```lean
import AlgebraLib.Prelude
open Algebra
example {R : Type} [CommRing R] (a b : R) : a * b + 0 = b * a := by
  rw [Ring.add_zero, CommRing.mul_comm]
```

For the square expansion, work on paper first: distributing
`(a + b) * (a + b)` creates four terms, one for each choice from the two
parentheses. Preserve their order initially, then turn `b * a` into `a * b`.
Finally compare the grouping with the requested right side.

The exercise writes the cross terms as a sum instead of `2 * a * b`.
That keeps the task focused on the operations and laws already introduced.
