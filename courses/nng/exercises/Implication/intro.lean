-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.succ_inj2

namespace MyNat

/-
We have seen how to `apply` theorems and assumptions
of the form `P → Q`. But what if our *goal* is of the form `P → Q`?
To prove this goal, we need to know how to say "let's assume `P` and deduce `Q`"
in Lean. We do this with the `intro` tactic.
-/
/- $x=37\implies x=37$. -/
example (x : ℕ) : x = 37 → x = 37 := by
  sorry

end MyNat
