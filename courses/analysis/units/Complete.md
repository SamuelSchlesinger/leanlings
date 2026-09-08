# Approximate a sequence of reals by rationals

The earlier capstone concerned rational Cauchy sequences. Completeness now
concerns an arbitrary Cauchy sequence of **reals**. The bridge is to choose
a rational approximation to each term with an error tending to zero.

```lean
import Complete.approx
open Analysis
example (x : Nat → MyReal) : ∃ q : Nat → MyRat, ∀ k,
    |x k - MyReal.ofRat (q k)| < MyReal.ofRat (MyReal.tolSeq k) := by
  classical
  exact ⟨fun k => Classical.choose (MyReal.approx (x k) (MyReal.tolSeq_pos k)),
    fun k => Classical.choose_spec (MyReal.approx (x k) (MyReal.tolSeq_pos k))⟩
```

This is a mathematical choice of approximations; it does not give an
executable numerical approximation algorithm for arbitrary reals.

The unit separates the proof into four lessons:

1. `approx` finds a rational close to a given real.
2. `approx_isCauchy` proves the rational approximations are Cauchy. Three
   errors contribute: two approximation errors and the distance between the
   original terms. Decide how to share the tolerance among them before
   writing any Lean.
3. `tendsto_of_approx` transfers a limit from the approximations to the
   original sequence. This time there are only two errors.
4. `complete` assembles those results with `cauchy_seq_converges`. No new
   epsilon estimate is needed in this last step.

For each estimate, write down the intermediate points in the triangle
inequality and the common threshold before starting. Then explain why the
first estimate needs the Cauchy hypothesis but the second only needs a
known limit for the approximations.

The approximation errors are measured in the reals, as `|x k - ofRat (q k)|`,
while the Cauchy condition on `q` is a statement about rationals. The
`ofRat` homomorphism lemmas move a rational goal into the reals, where the
bounds live.

## Toolkit

- `tolSeq k = 1/(k+1)`, with `tolSeq_pos : 0 < tolSeq k` and
  `tolSeq_lt : 0 < ε → ∃ K, ∀ k, K ≤ k → tolSeq k < ε`
- `ofRat` preserves order and absolute value:
  `ofRat_lt : a < b → ofRat a < ofRat b`, `ofRat_lt_iff`,
  `ofRat_abs : ofRat |a| = |ofRat a|`, `ofRat_sub`, `ofRat_add`
- Real estimates: `MyReal.abs_sub_le`, `MyReal.abs_sub_comm`,
  `MyReal.add_le_add_left`, `MyReal.add_lt_add`, `MyReal.lt_trans`
- `cauchy_seq_converges f hf : Tendsto (fun k => ofRat (f k)) (mk f hf)`,
  from the capstone
- `Classical.choose h` extracts a witness from `h : ∃ q, P q`, and
  `Classical.choose_spec h` proves `P (Classical.choose h)`
