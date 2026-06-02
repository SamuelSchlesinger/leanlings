-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvAddition.add_left_cancel

namespace MyNat

/-
`add_left_eq_self x y` is the theorem that $x + y = y\implies x=0.$
-/
/-- $x + y = y\implies x=0.$ -/
theorem add_left_eq_self (x y : ℕ) : x + y = y → x = 0 := by
  sorry

end MyNat
