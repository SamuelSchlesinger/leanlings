# What depends on the tolerance?

`IsCauchy f` means: for every positive rational tolerance `ε`, choose a
threshold `N` so that every two terms with indices at least `N` differ by
less than `ε`. `N` may depend on `ε`; it must work for all later pairs.
Keeping that quantifier order is the central task.

    IsCauchy f      := ∀ ε, 0 < ε → ∃ N, ∀ m n, N ≤ m → N ≤ n → |f m - f n| < ε
    CauchyEquiv f g := ∀ ε, 0 < ε → ∃ N, ∀ n, N ≤ n → |f n - g n| < ε
    constSeq q      := fun _ => q

An ε–N proof has a fixed shape: introduce the tolerance, choose the
threshold, introduce the late indices, then bound the difference. Here it
is on a fact that is not one of the exercises. Shifting a Cauchy sequence
by a constant keeps it Cauchy, with the same threshold.

```lean
import Cauchy.Defs
open Analysis
example {f : Nat → MyRat} (hf : IsCauchy f) (q : MyRat) :
    IsCauchy (fun n => f n + q) := by
  intro ε hε
  obtain ⟨N, hN⟩ := hf ε hε
  refine ⟨N, fun m n hm hn => ?_⟩
  show |(f m + q) - (f n + q)| < ε
  rw [MyRat.add_sub_add, MyRat.sub_self, MyRat.add_zero]
  exact hN m n hm hn
```

The `show` line restates the goal with the sequence applied to `m` and `n`.
Without it, `rw` may not find the sum inside `(fun n => f n + q) m`;
`dsimp only` does the same job.

For a sum of two Cauchy sequences, use part of the tolerance for each
sequence and a threshold large enough for both. This small index
calculation appears inside the estimate:

```lean
example (Nf Ng n : Nat) (hn : Nat.max Nf Ng ≤ n) : Nf ≤ n := by
  exact Nat.le_trans (Nat.le_max_left Nf Ng) hn
```

The triangle inequality combines the two bounds. Write the chain of
inequalities on paper first. A `calc` block in Lean can mix `=`, `≤`, and
`<` steps, and the result is strict if any step is.

`CauchyEquiv f g` compares the two sequences at the same index. It means
their difference tends to zero, which does not require pointwise equality.

## Toolkit

Rational facts, all in the `MyRat` namespace; some you proved, the rest are
in `Cauchy.Defs`:

- `exists_half : 0 < q → ∃ h, 0 < h ∧ h + h = q`, to split a tolerance
- `abs_add_le : |x + y| ≤ |x| + |y|`, and its difference form
  `abs_sub_le a b c : |a - c| ≤ |a - b| + |b - c|`
- `abs_sub_comm : |a - b| = |b - a|`, `sub_self : a - a = 0`, `abs_zero : |0| = 0`
- `add_sub_add : (a + b) - (c + d) = (a - c) + (b - d)`
- `neg_sub_neg : (-a) - (-b) = b - a`
- `add_lt_add : a < b → c < d → a + c < b + d`, `le_of_lt`, `lt_trans`, `le_trans`

Threshold arithmetic uses `Nat.max`, `Nat.le_max_left`, `Nat.le_max_right`,
and `Nat.le_trans`.
