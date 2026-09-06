-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.apply

namespace MyNat

/- If $x+1=4$ then $x=3$. -/
theorem exercise_implication_succ_inj (x : ℕ) (h : x + 1 = 4) : x = 3 := by
  rewrite [four_eq_succ_three] at h
  rewrite [←succ_eq_add_one] at h
  have h := succ_inj h
  exact h

end MyNat
