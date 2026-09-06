-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvAddition.add_left_eq_self

namespace MyNat

/-
`add_right_eq_self x y` is the theorem that $x + y = x\implies y=0.$
You can use cancellation directly, or commute the sum and reuse the
previous theorem. Try one approach, then explain how the other would work.
-/
/-- $x+y=x\implies y=0$. -/
theorem add_right_eq_self (x y : ℕ) : x + y = x → y = 0 := by
  sorry

end MyNat
