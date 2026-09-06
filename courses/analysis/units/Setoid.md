# Different fractions can be the same number

A fraction here stores an integer numerator, a positive integer denominator,
and evidence of positivity. The values `1/2` and `2/4` have different stored
fields but represent the same rational number. Cross-multiplication captures
this relation.

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
work: introduce a common denominator factor, rearrange, then cancel it.

Why does positivity matter? In particular, it says the denominator you
cancel is nonzero. Find that proof in the structure before attempting the
third exercise.
