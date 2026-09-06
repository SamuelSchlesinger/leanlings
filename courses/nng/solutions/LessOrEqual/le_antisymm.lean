-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_zero

namespace MyNat

/-- If $x \leq y$ and $y \leq x$, then $x = y$. -/
theorem le_antisymm (x y : ℕ) (hxy : x ≤ y) (hyx : y ≤ x) : x = y := by
  obtain ⟨a, ha⟩ := hxy
  obtain ⟨b, hb⟩ := hyx
  rewrite [ha]
  rewrite [ha, add_assoc] at hb
  have hb := Eq.symm hb
  have hb := add_right_eq_self _ _ hb
  have hb := add_right_eq_zero _ _ hb
  rewrite [hb, add_zero]
  rfl

end MyNat
