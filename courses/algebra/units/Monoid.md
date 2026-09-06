# An element that does nothing

A **monoid** adds an identity, written `1`, to a semigroup. Its two laws are
`1 * a = a` and `a * 1 = a`. The notation does not mean that its elements
must be numbers: the identity for string concatenation would be the empty
string.

```lean
import AlgebraLib.Prelude
open Algebra
example {M : Type} [Monoid M] (a : M) : 1 * (a * 1) = a := by
  rw [one_mul, mul_one]
```

The first exercises prove **uniqueness** of an identity. Given a candidate
`e` and a law `h : ∀ a, e * a = a`, you can apply that law to any element.
Choose `1`: the product `e * 1` can then be evaluated in two ways. Write those
two equalities down before using Lean.

Later, read `(1 : Bool)` using the Boolean instance. What value must it have
so that conjunction with it leaves every Boolean unchanged?
