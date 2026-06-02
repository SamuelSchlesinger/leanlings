-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_antisymm

namespace MyNat

/- If $x=37$ or $y=42$, then $y=42$ or $x=37$. -/
example (x y : ℕ) (h : x = 37 ∨ y = 42) : y = 42 ∨ x = 37 := by
  cases h with hx hy
  right
  exact hx
  left
  exact hy

end MyNat
