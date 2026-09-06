# Proving laws of structures

Start this course after the introductory lessons on structures, type classes,
`rw`, `calc`, and implications. You need to be able to read a goal and apply
a named theorem. The mathematical definitions are introduced here.

An algebraic structure is a type, some operations on that type, and laws those
operations satisfy. In a theorem, `{G : Type _} [Group G]` means: take any type
`G` equipped with the operations and laws of a group. A proof about this `G`
must work for every such group.

The notation `*` names the chosen operation. It might mean composition of
symmetries, or Boolean conjunction, rather than multiplication of numbers.
Before rewriting, identify the structure available and the law it supplies.
The definitions live in the `Algebra` namespace and belong to this course.

The import at the top of each exercise supplies the earlier reference
theorems. Your task is to add the next proof. Work on the statement as given;
you may use a different proof from the reference answer. When you finish a
unit, explain one proof aloud without tactic names before moving on.

## Follow the laws that are available

| Stage | New tools | What to practice |
| --- | --- | --- |
| Magma | A binary operation | Separate facts of a concrete example from structure axioms. |
| Semigroup | Associativity | Change grouping while preserving factor order. |
| Monoid | An identity | Specialize universal hypotheses to the identity. |
| Group | Inverses | Prove cancellation, then reuse it for uniqueness. |
| CommGroup, Division, Hom | Commutativity and derived operations | Rearrange deliberately and transport laws through a map. |
| Ring | Addition, negatives, distributivity | Translate group arguments into additive form. |
| CommRing, Field | Commutative multiplication and nonzero inverses | Track exactly where an additional assumption is used. |

This is a sequence of related structures, not one operation that acquires
every law forever. In particular, a ring's multiplication is a monoid; it is
not assumed to be a group. A field still includes zero, so its inverse law
has a nonzero hypothesis. The Boolean example at the start is a monoid under
conjunction but not a group: `false` has no inverse for that operation.

## Finding a useful intermediate equation

When a rewrite fails, inspect the parentheses before searching for more
lemmas. `a * b * c` groups to the left. The law you need may apply to a
whole product as one argument, such as `mul_assoc (a * b) c d`.

For uniqueness and cancellation, work backwards from an equation you can
simplify. To prove `b = c` from `a * b = a * c`, ask what operation undoes the
shared `a`. For a proposed inverse, ask which product should become `1`.
For a proposed negative, ask which sum should become `0`.

At the end of Group and Field, compare the two cancellation proofs. At the
end of Ring, explain why the expansion of `(a + b) * (c + d)` keeps the order
of every factor. These checkpoints test the mathematical assumptions behind
the tactic sequence.
