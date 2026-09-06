-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.succ_eq_add_one

namespace MyNat

/- $2+2=4$. -/
theorem exercise_tutorial_twoaddtwo : (2 : ℕ) + 2 = 4 := by
  rewrite (config := { occs := .pos [2] }) [two_eq_succ_one]
  rewrite [add_succ]
  rewrite [one_eq_succ_zero]
  rewrite [add_succ]
  rewrite [add_zero]
  rewrite [four_eq_succ_three]
  rewrite [three_eq_succ_two]
  rfl

end MyNat
