-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.succ_eq_add_one

namespace MyNat

/-
Good luck!

  One last hint. If `h : X = Y` then `rw [h]` will change *all* `X`s into `Y`s.
  If you only want to change one of them, say the 3rd one, then use
  `nth_rewrite 3 [h]`.
-/
/- $2+2=4$. -/
example : (2 : ℕ) + 2 = 4 := by
  sorry

end MyNat
