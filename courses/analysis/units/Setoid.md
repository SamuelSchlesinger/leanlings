# Different fractions can be the same number

A fraction here stores an integer numerator, a positive integer denominator,
and evidence of positivity: `a.num`, `a.den`, and `a.den_pos`. The values
`1/2` and `2/4` have different stored fields but represent the same rational
number. Cross-multiplication captures this relation:

    PreRat.r a b := a.num * b.den = b.num * a.den

```lean
import AnalysisLib.Prelude
open Analysis
example : PreRat.r ⟨1, 2, by decide⟩ ⟨2, 4, by decide⟩ := by
  unfold PreRat.r
  decide
```

An equivalence relation must be reflexive, symmetric, and transitive. These
laws let a quotient treat each class of related fractions as one object.
Reflexivity and symmetry use equality directly. Transitivity needs more
work: the two hypotheses share the middle fraction's fields, and the goal
does not mention them. Multiply the goal through by the middle denominator,
derive that scaled equation from the hypotheses, then cancel the factor.

Why does positivity matter? In particular, it says the denominator you
cancel is nonzero. Find that proof in the structure before attempting the
third exercise.

## Toolkit

`PreRat.r` is a definition. `unfold PreRat.r at *` turns every occurrence
into its integer equation; `PreRat.r_iff` states the same fact as an `↔`.

Integer arithmetic in this course is closed by two tactics. `omega` proves
linear facts, with no products of two variables. `grind` proves polynomial
identities and uses equations from the context, but it does not cancel a
factor from both sides of an equation. Cancellation is a lemma:

```lean
example (a b c : Int) (hc : c ≠ 0) (h : a * c = b * c) : a = b :=
  Int.eq_of_mul_eq_mul_right hc h
```

Applied backwards, `apply Int.eq_of_mul_eq_mul_right (a := c)` replaces the
goal `a = b` by `a * c = b * c`, at the cost of proving `c ≠ 0`. Products can
be reordered with `Int.mul_right_comm : a * b * c = a * c * b`, `Int.mul_comm`,
and `Int.mul_assoc`, or in one step by an equation you prove with `grind`.

To read the statement of any lemma, use `#check @Int.mul_right_comm`. To
search for one, write `exact?` in place of a proof: it reports a lemma that
closes the goal when one exists.
