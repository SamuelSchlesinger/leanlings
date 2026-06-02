-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.succ_inj

namespace MyNat

/- If $x+1=4$ then $x=3$. -/
example (x : ℕ) (h : x + 1 = 4) : x = 3 := by
  apply succ_inj
  rewrite [succ_eq_add_one]
  rewrite [← four_eq_succ_three]
  exact h

end MyNat
