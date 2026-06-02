-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.exact

namespace MyNat

/-
If the goal is not *exactly* a hypothesis, we can sometimes
use rewrites to fix things up.
-/
/- Assuming $0+x=(0+y)+2$, we have $x=y+2$. -/
example (x y : ℕ) (h : 0 + x = 0 + y + 2) : x = y + 2 := by
  sorry

end MyNat
