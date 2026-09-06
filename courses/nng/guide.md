# Building a theory one theorem at a time

This course introduces mathematical proof through natural numbers. Start with
the tutorial even if you already know the arithmetic: the point is to express
why each statement follows from the available facts.

The type `MyNat`, written `ℕ`, has constructors `0` and `succ`. Its arithmetic
operations are opaque and characterized by six stated axioms: the zero and
successor equations for addition, multiplication, and powers. Later theorems
are proved from those equations. This differs from evaluating arithmetic on
Lean's built-in `Nat`.

Imports supply the previous levels' reference theorems. You can therefore
work on one level at a time without a mistake in an earlier file breaking
the whole course. Names and theorem statements identify the task; replace
the `sorry` with your proof.

Read the assumptions above the goal before choosing a tactic. After each
tactic, compare the new goal with the previous one. When you use a hint, try
to explain why its first step helps before typing the rest of the proof.

This port uses core Lean's `rw`, which may close a reflexive equality
automatically. Reference answers often use `rewrite` followed by `rfl` to
make those two steps visible. If Lean says there are no goals left, the last
tactic may already have finished your proof.

Some shorthand belongs to this course: `use`, `apply … at`, `nth_rewrite`,
`induction n with d hd`, and `cases n with d`. The explicit branch syntax
shown in the unit notes transfers more directly to other Lean projects.

Adapted from the Natural Number Game. See `NOTICE` and `LICENSE` in this
course for the original authors, license, and changes made in this port.
