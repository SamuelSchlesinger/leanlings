-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_total

namespace MyNat

/-- If $\operatorname{succ}(x) \leq \operatorname{succ}(y)$ then $x \leq y$. -/
theorem succ_le_succ (x y : ℕ) (hx : succ x ≤ succ y) : x ≤ y := by
  cases hx with d hd
  use d
  rewrite [succ_add] at hd
  apply succ_inj at hd
  exact hd

end MyNat
