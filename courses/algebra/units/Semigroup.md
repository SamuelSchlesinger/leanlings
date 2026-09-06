# Parentheses have meaning

A **semigroup** is a magma with an associative operation:
`(a * b) * c = a * (b * c)`. This law changes grouping while preserving the
order of the elements. A semigroup need not be commutative.

```lean
import AlgebraLib.Prelude
open Algebra
example {S : Type} [Semigroup S] (a b c : S) :
    (a * b) * c = a * (b * c) := by
  exact mul_assoc a b c
```

Read `a * b * c` as `(a * b) * c`. For a longer product, draw the parentheses
you want before choosing `rw [mul_assoc]` or `rw [← mul_assoc]`. If a rewrite
hits the wrong product, supply explicit arguments to `mul_assoc`.

Try the first exercise one rewrite at a time, then combine the steps.
Before leaving this unit, explain why none of these proofs can swap `a` and
`b` without an additional assumption.
