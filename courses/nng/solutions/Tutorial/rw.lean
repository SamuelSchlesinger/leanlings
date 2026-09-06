-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.rfl

namespace MyNat

/- If $x$ and $y$ are natural numbers, and $y = x + 7$, then $2y = 2(x + 7)$. -/
theorem exercise_tutorial_rw
    (x y : ℕ) (h : y = x + 7) : 2 * y = 2 * (x + 7) := by
  rewrite [h]
  rfl

end MyNat
