-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.succ_inj

namespace MyNat

/-
In the last level, we manipulated the hypothesis `x + 1 = 4`
  until it became the goal `x = 3`. In this level we'll manipulate
  the goal until it becomes our hypothesis! In other words, we
  will "argue backwards". `apply succ_inj` changes the goal to
  `succ x = succ 3`. Which rewrites turn this into the type of `h`?
-/
/- If $x+1=4$ then $x=3$. -/
theorem exercise_implication_succ_inj2 (x : ℕ) (h : x + 1 = 4) : x = 3 := by
  sorry

end MyNat
