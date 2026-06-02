-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.intro

namespace MyNat

/-
Let's see if you can use the tactics we've learnt to prove $x+1=y+1\implies x=y$.
Try this one by yourself; if you need help then click on "Show more help!".
-/
/- $x+1=y+1 \implies x=y$. -/
example (x y : ℕ) : x + 1 = y + 1 → x = y := by
  sorry

end MyNat
