-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.succ_le_succ

namespace MyNat

/-- If $x \leq 1$ then either $x = 0$ or $x = 1$. -/
theorem le_one (x : ℕ) (hx : x ≤ 1) : x = 0 ∨ x = 1 := by
  cases x with y
  left
  rfl
  rewrite [one_eq_succ_zero] at hx ⊢
  apply succ_le_succ at hx
  apply le_zero at hx
  rewrite [hx]
  right
  rfl

end MyNat
