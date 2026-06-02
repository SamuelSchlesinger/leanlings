-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Addition.add_assoc

namespace MyNat

/-- If $a, b$ and $c$ are arbitrary natural numbers, we have
$(a + b) + c = (a + c) + b$. -/
theorem add_right_comm (a b c : ℕ) : a + b + c = a + c + b := by
  rewrite [add_assoc]
  rewrite [add_comm b, add_assoc]
  rfl

end MyNat
