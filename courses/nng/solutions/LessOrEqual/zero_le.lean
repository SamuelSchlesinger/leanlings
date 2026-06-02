-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_refl

namespace MyNat

/-- If $x$ is a number, then $0 \le x$. -/
theorem zero_le (x : ℕ) : 0 ≤ x := by
  use x
  rewrite [zero_add]
  rfl

end MyNat
