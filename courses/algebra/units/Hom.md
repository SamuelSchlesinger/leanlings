# A map that preserves multiplication

A **group homomorphism** bundles a function `f.toFun : G → H` with a law
`f.map_mul`. The law says that applying the function to a product gives the
product of the two images.

```lean
import AlgebraLib.Prelude
open Algebra
example {G H : Type} [Group G] [Group H] (f : GroupHom G H) (a b : G) :
    f.toFun (a * b) * 1 = f.toFun a * f.toFun b := by
  rw [mul_one, f.map_mul]
```

The product inside `f.toFun` belongs to `G`; the product outside belongs to
`H`. Tracking these types helps you choose where a group law applies.

The structure only assumes preservation of multiplication. This unit derives
preservation of the identity and inverses. For identity preservation, apply
the map law to `1 * 1`, then use cancellation in the target group. For
inverses, map an inverse equation and use uniqueness of an inverse.
