# Prove on representatives, conclude on rationals

Every `MyRat` has a representative `mk numerator denominator positive`.
`induction x using MyRat.ind` lets you prove a proposition by considering an
arbitrary representative. This is quotient induction; it has no smaller
number and no recursive induction hypothesis.

```lean
import Rat.Ops
open Analysis
example : MyRat.mk 1 2 (by decide) + MyRat.mk 1 2 (by decide) =
    MyRat.mk 1 1 (by decide) := by
  rw [MyRat.add_mk, MyRat.mk_eq]
  decide
```

First `add_mk` computes the representative of the sum. Then `mk_eq` turns
equality of rational numbers into cross-multiplication of integers.
In the exercises the numerators are variables, so use algebraic reasoning
instead of concrete evaluation.

An inverse needs a nonzero numerator. Derive that fact from the nonzero
rational hypothesis before selecting the inverse computation lemma.
