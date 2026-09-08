# The represented real is the limit

A rational Cauchy sequence already gives a real by construction. You now
prove that its rational terms, embedded into the reals, converge to that
real. Constructing a candidate and proving convergence are separate steps.

    Tendsto x L := ∀ ε : MyRat, 0 < ε → ∃ N, ∀ n, N ≤ n → |x n - L| < ofRat ε

Embedding a rational uses a constant sequence:

```lean
import Real.Defs
open Analysis
example (q : MyRat) : MyReal.ofRat q =
    MyReal.mk (constSeq q) (const_isCauchy q) := by
  rfl
```

The order on reals is defined through positivity. `x < y` means
`IsPos (y - x)`, and a real `mk g hg` is positive when its representative
is eventually bounded below by a fixed positive rational. So a strict
inequality between reals is proved by computing a representative of the
difference and exhibiting that rational margin, a threshold, and the
eventual estimate:

```lean
import Real.Limit
open Analysis
example : (0 : MyReal) < 1 := by
  rw [MyReal.lt_def, MyReal.sub_zero, MyReal.one_def, MyReal.isPos_mk]
  exact ⟨1, MyRat.zero_lt_one, 0, fun n _ => MyRat.le_refl 1⟩
```

In the convergence proof, split the requested tolerance into two parts:
one bounds the Cauchy error, and the other leaves the positive margin
needed for strict inequality.

Trace the two indices carefully. One selects the embedded term whose
distance is being bounded; the other indexes a representative of the real.
The Cauchy condition controls both once they are beyond its threshold.

## Toolkit

- `MyReal.lt_def : (x < y) = IsPos (y - x)`, or `show IsPos (y - x)` directly;
  `MyReal.sub_zero : x - 0 = x`
- `MyReal.isPos_mk : IsPos (mk g hg) ↔ ∃ q, 0 < q ∧ ∃ N, ∀ n, N ≤ n → q ≤ g n`
- `MyReal.ofRat_def`, `MyReal.sub_mk`, and `MyReal.abs_mk` compute a
  representative of a difference of reals as a pointwise expression;
  `simp only [constSeq]` then evaluates the constant sequences in it
- On the rational side: `MyRat.sub_eq : a - b = a + -b`, useful backwards to
  fold `a + -b` into a subtraction; `MyRat.le_sub_iff : a ≤ b - c ↔ a + c ≤ b`;
  `MyRat.le_of_lt`; `MyRat.add_le_add_left`
