-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_zero

namespace MyNat

/-- If $x \leq y$ and $y \leq x$, then $x = y$. -/
theorem le_antisymm (x y : ℕ) (hxy : x ≤ y) (hyx : y ≤ x) : x = y := by
  cases hxy with a ha
  cases hyx with b hb
  rewrite [ha]
  rewrite [ha, add_assoc] at hb
  symm at hb
  apply add_right_eq_self at hb
  apply add_right_eq_zero at hb
  rewrite [hb, add_zero]
  rfl

end MyNat
