# When order can change

A **commutative group** adds `a * b = b * a`. You may now change order as
well as grouping, but these are still distinct steps in a proof.

```lean
import AlgebraLib.Prelude
open Algebra
example {G : Type} [CommGroup G] (a b c : G) :
    a * (b * c) = a * (c * b) := by
  rw [CommGroup.mul_comm b c]
```

Giving the two arguments selects the inner product. An unrestricted rewrite
with commutativity might select the outside product instead.

Start the unit by revisiting the inverse of a product from the previous unit.
The old theorem gives the factors in reversed order. Which single new law
lets you put them in the order requested here?

For the four-factor exercise, first identify the two factors to exchange,
then make them neighbors using associativity.
