# An operation must ignore the choice of representative

The quotient now identifies equivalent fractions. For example:

```lean
import Rat.Quotient
open Analysis
example : MyRat.mk 1 2 (by decide) = MyRat.mk 2 4 (by decide) := by
  rw [MyRat.mk_eq]
  decide
```

Suppose we tried to define the numerator of a rational by reading its stored
numerator. The two equal rationals above would give `1` and `2`, so this
would not be a well-defined function on the quotient.

Addition and multiplication do work, but you must prove that replacing
inputs by equivalent fractions gives equivalent outputs. Unfold the
relation and the operation to see the corresponding integer equations.

For order, multiplying an inequality by a denominator also needs its sign.
Scale by positive products, use the input relations, then cancel a positive
factor. Keep equality rearrangement separate from order reasoning.

The order exercises prove one implication. To obtain the reverse implication,
apply the same theorem with the representatives exchanged and the equivalence
proofs reversed by `PreRat.r_symm`. Together the two implications give the
iff required to put a relation on the quotient.
