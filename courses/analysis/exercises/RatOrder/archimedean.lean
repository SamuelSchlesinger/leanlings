import RatOrder.abs_lt

namespace Analysis
open MyRat

/- The Archimedean property: no rational is an upper bound for ℕ. Concretely,
every `x` is below some natural number `n` (embedded by `ofInt n`).

For `x = mk a b hb`, the witness `n = a.natAbs + 1` works. After `ofInt_def`,
`lt_mk`, `push_cast`, the goal `a * 1 < (↑a.natAbs + 1) * b` follows from
`a ≤ ↑a.natAbs < ↑a.natAbs + 1 ≤ (↑a.natAbs + 1) * b`; get the last `≤` from
`Int.mul_le_mul_of_nonneg_left` (since `1 ≤ b`) and let `omega` assemble it. -/
theorem MyRat.archimedean (x : MyRat) : ∃ n : ℕ, x < ofInt (n : Int) := by
  sorry

end Analysis
