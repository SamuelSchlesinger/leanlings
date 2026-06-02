-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.apply

namespace MyNat

/- If $x+1=4$ then $x=3$. -/
example (x : ℕ) (h : x + 1 = 4) : x = 3 := by
  rewrite [four_eq_succ_three] at h
  rewrite [←succ_eq_add_one] at h
  apply succ_inj at h
  exact h

end MyNat
