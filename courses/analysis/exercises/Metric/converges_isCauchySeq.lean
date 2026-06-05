import Metric.tendsto_const

namespace Analysis
open MyReal

/- A convergent sequence is Cauchy — the first real theorem of metric-space
analysis, and a model ε/2 argument. If `x n` is eventually within `ofRat η` of
`L` (with `η + η = ε`), then for large `m, n`,

  dist (x m) (x n) ≤ dist (x m) L + dist L (x n) < ofRat η + ofRat η = ofRat ε.

Tools: `MyRat.exists_half hε` (splits `ε`), `dist_triangle`, `MyReal.add_lt_add`,
`dist_comm` (to turn `dist L (x n)` into `dist (x n) L`), and
`ofRat η + ofRat η = ofRat ε` via `rw [← MyReal.ofRat_add, hηη]`. A `calc` across
`≤`, `<`, `=` works — the `Trans` instances are already set up. -/
theorem Converges.isCauchySeq {X : Type _} [MetricSpace X] {x : ℕ → X} {L : X}
    (h : Converges x L) : IsCauchySeq x := by
  sorry

end Analysis
