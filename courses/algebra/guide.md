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
