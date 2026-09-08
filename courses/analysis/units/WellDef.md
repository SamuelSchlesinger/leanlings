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
inputs by equivalent fractions gives equivalent outputs. The operations on
representatives are ordinary fraction arithmetic:

    PreRat.add x y   := ⟨x.num * y.den + y.num * x.den, x.den * y.den, _⟩
    PreRat.mul x y   := ⟨x.num * y.num, x.den * y.den, _⟩
    PreRat.neg x     := ⟨-x.num, x.den, _⟩
    PreRat.ltAux x y := x.num * y.den < y.num * x.den
    PreRat.leAux x y := x.num * y.den ≤ y.num * x.den

Unfold the relation and the operation to see the corresponding integer
statement. For an equation, that statement is a polynomial identity which
follows from the hypotheses by ring arithmetic. Here is the shape, on a fact
that is not one of the exercises: `add` is commutative on representatives.

```lean
import AnalysisLib.Prelude
open Analysis
example (a b : PreRat) : PreRat.r (PreRat.add a b) (PreRat.add b a) := by
  simp only [PreRat.r, PreRat.add]
  grind
```

With hypotheses, unfold them too (`at *`), and `grind` combines them.

For order, multiplying an inequality by a denominator also needs its sign.
Scale by positive products, use the input relations, then cancel a positive
factor. Keep equality rearrangement separate from order reasoning: prove a
rearrangement as its own equation with `grind`, then `rw` with it inside
the inequality.

The order exercises prove one implication. To obtain the reverse implication,
apply the same theorem with the representatives exchanged and the equivalence
proofs reversed by `PreRat.r_symm`. Together the two implications give the
iff required to put a relation on the quotient.

## Toolkit

A hypothesis `hac : PreRat.r a c` is, by definition, the equation
`a.num * c.den = c.num * a.den`. Either `unfold PreRat.r at hac`, or restate
it with `have hac' : a.num * c.den = c.num * a.den := hac`.

Scaling and cancelling an inequality by a positive integer:

```lean
example (a b c : Int) (h : a < b) (hc : 0 < c) : a * c < b * c :=
  Int.mul_lt_mul_of_pos_right h hc

example (a b c : Int) (hc : 0 < c) (h : a * c < b * c) : a < b :=
  (Int.mul_lt_mul_right hc).mp h
```

The `≤` versions are `Int.mul_le_mul_of_nonneg_right` (scale by `0 ≤ c`) and
`Int.mul_le_mul_right` (cancel `0 < c`). `Int.mul_pos` shows a product of
positives is positive, and `Int.le_of_lt` weakens `<` to `≤`.
