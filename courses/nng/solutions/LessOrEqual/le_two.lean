-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_one

namespace MyNat

/-- If $x \leq 2$ then $x = 0$ or $1$ or $2$. -/
theorem le_two (x : ℕ) (hx : x ≤ 2) : x = 0 ∨ x = 1 ∨ x = 2 := by
  cases x with y
  left
  rfl
  cases y with z
  right
  left
  rewrite [one_eq_succ_zero]
  rfl
  rewrite [two_eq_succ_one, one_eq_succ_zero] at hx ⊢
  apply succ_le_succ at hx
  apply succ_le_succ at hx
  apply le_zero at hx
  rewrite [hx]
  right
  right
  rfl

end MyNat
