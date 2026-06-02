-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_total

namespace MyNat

/-
We've proved that `x ≤ 0` implies `x = 0`. The last two levels
in this world will prove which numbers are `≤ 1` and `≤ 2`.
This lemma will be helpful for them.
-/
/-- If $\operatorname{succ}(x) \leq \operatorname{succ}(y)$ then $x \leq y$. -/
theorem succ_le_succ (x y : ℕ) (hx : succ x ≤ succ y) : x ≤ y := by
  sorry

end MyNat
