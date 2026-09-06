# Undoing an operation

A **group** is a monoid with an inverse for each element. The laws are
`a⁻¹ * a = 1` and `a * a⁻¹ = 1`. Think of reversible actions: an inverse
undoes an action. Inverses let you prove cancellation and uniqueness.

```lean
import AlgebraLib.Prelude
open Algebra
example {G : Type} [Group G] (a : G) : (a * a⁻¹) * a = a := by
  rw [Group.mul_inv_cancel, one_mul]
```

For a longer expression, first group an element with its inverse, then apply
the inverse law, then remove the identity. Associativity changes the grouping;
it does not change the order. In particular, the inverse of `a * b` is
`b⁻¹ * a⁻¹`: undo the second action before the first.

To prove cancellation from `a * b = a * c`, apply multiplication by `a⁻¹`
on the left and simplify both sides. A `calc` chain can show this reasoning
without hiding the intermediate expressions.

These are abstract groups. A nonzero hypothesis is not needed to invert an
element; fields later have a different multiplicative structure.
