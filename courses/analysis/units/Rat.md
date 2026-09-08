# Prove on representatives, conclude on rationals

Every `MyRat` has a representative `mk numerator denominator positive`.
`induction x using MyRat.ind` lets you prove a proposition by considering an
arbitrary representative. This is quotient induction; it has no smaller
number and no recursive induction hypothesis.

Here is the representative step by itself. Its conclusion says that some
fraction represents `x`; the positivity proof is one of the witnesses.

```lean
import Rat.Ops
open Analysis
example (x : MyRat) : ∃ a b : Int, ∃ hb : 0 < b, x = MyRat.mk a b hb := by
  induction x using MyRat.ind with
  | _ a b hb => exact ⟨a, b, hb, rfl⟩
```

The branch names `a`, `b`, and `hb` stand for the numerator, denominator,
and its positivity proof. In an arithmetic exercise, work inside this branch
before using `add_mk` or `mul_mk`: those lemmas cannot compute with a bare
variable `x`. For two rationals, introduce representatives for both.

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

Once you have proved a law, you can use it without returning to fractions.
For example, a left identity and commutativity give a right identity. The
exercises on `add_zero`, `mul_one`, and `right_distrib` ask you to practice
that reuse. Decide whether the next task needs representatives or follows
from the abstract arithmetic laws you already established.
