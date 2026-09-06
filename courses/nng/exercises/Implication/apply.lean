-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.exact2

namespace MyNat

/-
In this level, the hypothesis `h2` is an *implication*. It says
that *if* `x = 37` *then* `y = 42`. We can use this
hypothesis with the `apply` tactic.
-/
/- If $x=37$ and we know that $x=37\implies y=42$ then we can deduce $y=42$. -/
theorem exercise_implication_apply (x y : ℕ) (h1 : x = 37) (h2 : x = 37 → y = 42) : y = 42 := by
  sorry

end MyNat
