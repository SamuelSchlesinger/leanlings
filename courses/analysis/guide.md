# Constructing numbers, then proving convergence

This is an advanced course. Begin with confidence in Lean's functions,
structures, propositions, `intro`, `rw`, `calc`, and existential witnesses.
You should also be comfortable with fractions, inequalities, and the idea of
an epsilon argument. The unit notes introduce quotient constructions and
explain how the mathematics determines the shape of a Lean proof.

The course has three connected tasks: identify fractions that represent the
same rational number; identify Cauchy sequences that represent the same real
number; prove that Cauchy sequences of reals have limits. The last task is
stronger than showing that a rational Cauchy sequence represents a real.

`MyRat` and `MyReal` are this course's constructions in the `Analysis`
namespace. They are distinct from Lean's built-in numeric types and from
Mathlib's types. A theorem name such as `MyRat.add_comm` tells you which
number system it concerns. Sequence indices use ordinary natural numbers.

The imports provide substantial proved infrastructure: quotient operations,
boundedness and product estimates, positivity, inverse construction, and
order tools. You prove the statements in the exercise files using that
infrastructure. A completed exercise does not mean that you independently
constructed every supporting theorem.

Before starting a proof, write its mathematical plan in two or three
sentences. In a quotient proof, name the representatives and the relation
you must establish. In a convergence proof, name the tolerance, threshold,
and eventual estimate. Then translate one sentence at a time into Lean.
