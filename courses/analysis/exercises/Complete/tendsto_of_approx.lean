import Complete.approx_isCauchy

namespace Analysis
open MyReal

/- # Transfer a limit back to the original sequence

Suppose the rational approximations, embedded in the reals, converge to
`L`. Show that `x` converges to the same `L`. This step only needs the
approximation bounds and the known limit; it does not use a Cauchy
hypothesis on `x`.

Travel from `x k` to `L` through `ofRat (q k)`. Allocate half the target
tolerance to the approximation error and half to the distance from the
approximation to `L`. Take a common threshold so both estimates apply.

The skeleton provides the tolerance and threshold. Fill in the triangle
estimate, using `hqspec k`, the eventual bound `hK0`, and the convergence
bound `hK1`. Compare this two-piece estimate with the three-piece one in
the preceding lesson. Explain why the number of errors changes.
-/
theorem MyReal.tendsto_of_approx {x : ℕ → MyReal} {q : ℕ → MyRat} {L : MyReal}
    (hqspec : ∀ k, |x k - ofRat (q k)| < ofRat (tolSeq k))
    (hq : Tendsto (fun k => ofRat (q k)) L) : Converges x L := by
  intro ε hε
  obtain ⟨η, hη, hηη⟩ := MyRat.exists_half hε
  obtain ⟨K0, hK0⟩ := tolSeq_lt hη
  obtain ⟨K1, hK1⟩ := hq η hη
  refine ⟨Nat.max K0 K1, fun k hk => ?_⟩
  show |x k - L| < ofRat ε
  sorry

end Analysis
