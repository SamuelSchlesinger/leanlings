-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_succ_self

namespace MyNat

/-- If $x \leq y$ and $y \leq z$, then $x \leq z$. -/
theorem le_trans (x y z : ℕ) (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z := by
  cases hxy with a ha
  cases hyz with b hb
  use a + b
  rewrite [hb, ha]
  exact add_assoc x a b

end MyNat
