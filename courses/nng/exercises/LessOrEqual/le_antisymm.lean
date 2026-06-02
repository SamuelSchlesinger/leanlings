-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_zero

namespace MyNat

/-
This level asks you to prove *antisymmetry* of $\leq$.
In other words, if $x \leq y$ and $y \leq x$ then $x = y$.
It's the trickiest one so far. Good luck!
-/
/-- If $x \leq y$ and $y \leq x$, then $x = y$. -/
theorem le_antisymm (x y : ℕ) (hxy : x ≤ y) (hyx : y ≤ x) : x = y := by
  sorry

end MyNat
