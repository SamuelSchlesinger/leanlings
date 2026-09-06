-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.intro2

namespace MyNat

/- If $x=y$ and $x \neq y$ then we can deduce a contradiction. -/
theorem exercise_implication_ne (x y : ℕ) (h1 : x = y) (h2 : x ≠ y) : False := by
  have h1 := h2 h1
  exact h1

end MyNat
