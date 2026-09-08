# Inverting a sequence needs a bound away from zero

A nonzero real may have negative representatives. The useful eventual bound
is on their **absolute values**: `q ≤ |f n|` for a fixed `q > 0` and all
sufficiently large `n`. That ensures those terms are nonzero.

```lean
import Real.Inv
open Analysis
example (q x : MyRat) (hq : 0 < q) (hx : q ≤ |x|) : x ≠ 0 := by
  exact MyRat.ne_zero_of_pos_abs hq hx
```

The infrastructure proves that the reciprocal sequence is Cauchy. Your task
is the inverse law. Past the threshold, the rational inverse law makes
`f n * (f n)⁻¹` equal to `1`, so the difference from the constant-one
sequence is zero.

The finitely many earlier terms do not affect equivalence of Cauchy
sequences. In the proof, choose a threshold after which all the needed
facts apply instead of trying to establish the inverse equation at every
index.

## Toolkit

- `MyReal.mk_eq_zero_iff : mk f hf = 0 ↔ CauSeq.Null ⟨f, hf⟩`, where
  `CauSeq.Null` means the representative is `CauchyEquiv` to the zero sequence
- `CauSeq.apart : ¬ CauSeq.Null f → ∃ q, 0 < q ∧ ∃ N, ∀ n, N ≤ n → q ≤ |f.seq n|`
- `MyReal.inv_mk_of_not_null hnn : (mk f hf)⁻¹ = mk (fun n => (f n)⁻¹) _`
- `MyRat.ne_zero_of_pos_abs : 0 < q → q ≤ |a| → a ≠ 0`, and your own
  `MyRat.mul_inv_cancel`
- `MyReal.eq_of_equiv` reduces an equation of reals to a `CauchyEquiv`, which
  you prove with an ε–N argument as in the Cauchy world; `MyReal.mul_mk` and
  `MyReal.one_def` compute the two sides first
