-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.one_le_of_ne_zero

namespace MyNat

/-
Every factor of a nonzero product is at most the product. First show that
`b` is nonzero, so `1 ≤ b`. Multiplying that inequality by `a` gives the
desired bound after simplifying. Use `mul_left_ne_zero`,
`one_le_of_ne_zero`, and `mul_le_mul_right` in that order.

Explain why the hypothesis cannot be dropped: what happens when `a = 1`
and `b = 0`?
-/
theorem le_mul_right (a b : ℕ) (h : a * b ≠ 0) : a ≤ a * b := by
  sorry

end MyNat
