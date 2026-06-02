-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvAddition.add_right_eq_zero

namespace MyNat

/-
You can just mimic the previous proof to do this one -- or you can figure out a way
of using it.
-/
/-- If $a+b=0$ then $b=0$. -/
theorem add_left_eq_zero (a b : ℕ) : a + b = 0 → b = 0 := by
  sorry

end MyNat
