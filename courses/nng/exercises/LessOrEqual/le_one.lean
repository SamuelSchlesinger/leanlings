-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.succ_le_succ

namespace MyNat

/-
We've seen `le_zero`, the proof that if `x ≤ 0` then `x = 0`.
Now we'll prove that if `x ≤ 1` then `x = 0` or `x = 1`.
-/
/-- If $x \leq 1$ then either $x = 0$ or $x = 1$. -/
theorem le_one (x : ℕ) (hx : x ≤ 1) : x = 0 ∨ x = 1 := by
  sorry

end MyNat
