-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_trans

namespace MyNat

/-- If $x \leq 0$, then $x=0$. -/
theorem le_zero (x : ℕ) (hx : x ≤ 0) : x = 0 := by
  obtain ⟨y, hy⟩ := hx
  have hy := Eq.symm hy
  have hy := add_right_eq_zero _ _ hy
  exact hy

end MyNat
