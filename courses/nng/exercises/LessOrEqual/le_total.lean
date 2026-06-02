-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.or_symm

namespace MyNat

/-
This is I think the toughest level yet. Tips: if `a` is a number
then `cases a with b` will split into cases `a = 0` and `a = succ b`.
And don't go left or right until your hypotheses guarantee that
you can prove the resulting goal!

I've left hidden hints; if you need them, retry from the beginning
and click on "Show more help!"
-/
/-- If $x$ and $y$ are numbers, then either $x \leq y$ or $y \leq x$. -/
theorem le_total (x y : ℕ) : x ≤ y ∨ y ≤ x := by
  sorry

end MyNat
