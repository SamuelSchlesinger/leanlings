# Why cancellation needs a hypothesis

A **field** is a nontrivial commutative ring in which every nonzero element
has a multiplicative inverse. Here `0⁻¹` is defined to be `0`, but
`a * a⁻¹ = 1` requires `a ≠ 0`. The assumption `0 ≠ 1` rules out a
one-element ring.

```lean
import AlgebraLib.Prelude
open Algebra
example {F : Type} [Field F] (a : F) (ha : a ≠ 0) :
    a * a⁻¹ + 0 = 1 := by
  rw [Field.mul_inv_cancel a ha, Ring.add_zero]
```

Notice where the proof `ha` is passed to the inverse law. Whenever you want
to divide or cancel, first identify the element whose nonzero proof is needed.

The later exercises show that a product can be zero only if a factor is zero.
For `a * b = 0`, split on whether `a = 0`. In the nonzero case, multiply by
its inverse. This is a use of classical case analysis; add `classical` if
Lean needs a decision instance for equality on the abstract field.
