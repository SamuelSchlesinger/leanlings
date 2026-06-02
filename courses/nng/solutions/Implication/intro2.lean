-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.intro

namespace MyNat

/- $x+1=y+1 \implies x=y$. -/
example (x y : ℕ) : x + 1 = y + 1 → x = y := by
  intro h
  repeat rewrite [← succ_eq_add_one] at h
  apply succ_inj at h
  exact h

end MyNat
