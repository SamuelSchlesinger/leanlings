-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_succ_self

namespace MyNat

/-
In this level, we see inequalities as *hypotheses*. We have not seen this before.
The `cases` tactic can be used to take `hxy` apart.
-/
/-- If $x \leq y$ and $y \leq z$, then $x \leq z$. -/
theorem le_trans (x y z : ℕ) (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z := by
  sorry

end MyNat
