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

## Three passes through the construction

| Pass | Units | Central proof obligation |
| --- | --- | --- |
| Fractions to rationals | Setoid, WellDef, Rat, RatOrder | Equivalent representatives give the same arithmetic and order. |
| Rational sequences to reals | Cauchy, Real, Capstone | Differences tending to zero define equality, and a rational Cauchy sequence represents its limit. |
| Completeness for real sequences | Metric, RealField, Complete | Rational approximations connect a Cauchy sequence of reals to a represented limit. |

Pause after each pass. For the first, explain why reading a fraction's
numerator cannot define a function on rationals. For the second, explain why
pointwise equality is sufficient but unnecessary for two sequences to
represent the same real. For the third, identify what must be proved about
the approximating sequence before it can represent a real.

## Keep the proof obligations separate

A quotient proof often ends in integer arithmetic. Before using `grind`,
name the relation or operation you unfolded and read the resulting equation.
Automation checks that equation; the choice to reduce to representatives is
the mathematical part you need to understand and be able to repeat.

In an epsilon argument, maintain a small ledger: the target tolerance, the
share allocated to each error, and the threshold where each bound holds.
Take a maximum only after identifying all the bounds it must satisfy. Use
`Nat.le_trans` to pass from the common threshold to an individual one.

Finally, keep types visible. Indices are `Nat`, tolerances are positive
`MyRat` values, and distances between reals are `MyReal` values. An `ofRat`
conversion often marks the boundary between two parts of the argument.
The final unit practices its three-error Cauchy estimate and two-error
convergence estimate separately, then asks you to assemble them.
