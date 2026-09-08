-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_one

namespace MyNat

/-
This classifies every possible value bounded by two. It is the same pattern
as the preceding bound by one, with one additional successor case.

You'll need to know that `∨` is right associative. This means that
`x = 0 ∨ x = 1 ∨ x = 2` actually means `x = 0 ∨ (x = 1 ∨ x = 2)`.
This affects how `left` and `right` work.
-/
/-- If $x \leq 2$ then $x = 0$ or $1$ or $2$. -/
theorem le_two (x : ℕ) (hx : x ≤ 2) : x = 0 ∨ x = 1 ∨ x = 2 := by
  sorry

end MyNat
