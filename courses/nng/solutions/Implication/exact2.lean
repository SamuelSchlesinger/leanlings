-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.exact

namespace MyNat

/- Assuming $0+x=(0+y)+2$, we have $x=y+2$. -/
theorem exercise_implication_exact2 (x y : ℕ) (h : 0 + x = 0 + y + 2) : x = y + 2 := by
  rewrite [zero_add] at h
  rewrite [zero_add] at h
  exact h

end MyNat
