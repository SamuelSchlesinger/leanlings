# What depends on the tolerance?

`IsCauchy f` means: for every positive rational tolerance `ε`, choose a
threshold `N` so that every two terms with indices at least `N` differ by
less than `ε`. `N` may depend on `ε`; it must work for all later pairs.
Keeping that quantifier order is the central task.

For a sum of two Cauchy sequences, use half the tolerance for each sequence
and a threshold large enough for both. This small index calculation appears
inside the estimate:

```lean
example (Nf Ng n : Nat) (hn : Nat.max Nf Ng ≤ n) : Nf ≤ n := by
  exact Nat.le_trans (Nat.le_max_left Nf Ng) hn
```

The triangle inequality combines the two bounds. The proof skeleton supplies
the witnesses in the first sum exercise; the transitivity exercise asks you
to reconstruct the same strategy with less scaffolding.

`CauchyEquiv f g` compares the two sequences at the same index. It means
their difference tends to zero, which does not require pointwise equality.
