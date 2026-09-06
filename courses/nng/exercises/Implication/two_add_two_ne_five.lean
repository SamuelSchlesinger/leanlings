-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.one_ne_zero

namespace MyNat

/-
2 + 2 ≠ 5 is boring to prove in full, given only the tools we have currently.
To make it a bit less painful, I have unfolded all of the numerals for you.
See if you can use `zero_ne_succ` and `succ_inj` to prove this.
-/
/- $2+2≠5$. -/
theorem exercise_implication_two_add_two_ne_five : succ (succ 0) + succ (succ 0) ≠ succ (succ (succ (succ (succ 0)))) := by
  sorry

end MyNat
