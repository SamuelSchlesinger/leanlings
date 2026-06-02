-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_trans

namespace MyNat

/-
It's "intuitively obvious" that there are no numbers less than zero,
but to prove it you will need a result which you showed in advanced
addition world.
-/
/-- If $x \leq 0$, then $x=0$. -/
theorem le_zero (x : ℕ) (hx : x ≤ 0) : x = 0 := by
  sorry

end MyNat
