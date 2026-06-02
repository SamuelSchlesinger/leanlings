-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.add_sq

namespace MyNat

/-
In this world we'll learn how to prove theorems of the form $P\implies Q$.
In other words, how to prove theorems of the form "if $P$ is true, then $Q$ is true."
To do that we need to learn some more tactics.

The `exact` tactic can be used to close a goal which is exactly one of
the hypotheses. It takes the name of the hypothesis as argument: `exact h`.
-/
/- Assuming $x+y=37$ and $3x+z=42$, we have $x+y=37$. -/
example (x y z : ℕ) (h1 : x + y = 37) (h2 : 3 * x + z = 42) : x + y = 37 := by
  sorry

end MyNat
