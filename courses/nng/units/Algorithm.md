# Automating a proof you understand

Associativity and commutativity rearrange sums. Supplying them to
`simp only` packages repeated rearrangements into a normalization procedure.
The `add_algo3` exercise supplies the custom `simp_add` tactic as a small
wrapper around that procedure. It becomes available at its declaration.

```lean
import Algorithm.add_left_comm
open MyNat
example (a b : ℕ) : a + b = b + a := by
  simp only [add_comm]
```

The second part studies constructor tests: a predecessor proves successor
injectivity, and a zero test distinguishes zero from a successor. These
facts justify the decision procedure for equality of `MyNat` values.

`decide` can run that procedure on constructor expressions. It cannot
evaluate our opaque arithmetic directly. Normalize numeral sums with the
stated arithmetic equations first. This connects the proof rules you used
by hand with the automation used in the final exercises.
