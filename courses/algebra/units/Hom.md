# A map that preserves multiplication

A **group homomorphism** bundles a function `f.toFun : G → H` with a law
`f.map_mul`. The law says that applying the function to a product gives the
product of the two images.

Write `f.toFun a` to apply the function. This course's small `GroupHom`
structure has no automatic conversion to a function, so `f a` alone is
not accepted as Lean code.

```lean
import AlgebraLib.Prelude
open Algebra
example {G H : Type} [Group G] [Group H] (f : GroupHom G H) (a b : G) :
    f.toFun (a * b) * 1 = f.toFun a * f.toFun b := by
  rw [mul_one, f.map_mul]
```

The product inside `f.toFun` belongs to `G`; the product outside belongs to
`H`. Tracking these types helps you choose where a group law applies.

Here is a complete homomorphism: the identity function on any group. To
construct one, supply both the function and a proof of its multiplication law.

```lean
import AlgebraLib.Prelude
open Algebra
def identityHom {G : Type} [Group G] : GroupHom G G where
  toFun a := a
  map_mul _ _ := rfl

example {G : Type} [Group G] (a : G) : identityHom.toFun a = a := rfl
```

The proof is `rfl` because applying the identity function changes neither
side of the law. A constant map to the target identity is another example;
decide which identity law would prove its `map_mul` field.

The structure only assumes preservation of multiplication. This unit derives
preservation of the identity and inverses. For identity preservation, apply
the map law to `1 * 1`, then use cancellation in the target group. For
inverses, map an inverse equation and use uniqueness of an inverse.
