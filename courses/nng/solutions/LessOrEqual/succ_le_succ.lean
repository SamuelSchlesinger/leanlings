-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_total

namespace MyNat

/-- If $\operatorname{succ}(x) \leq \operatorname{succ}(y)$ then $x \leq y$. -/
theorem succ_le_succ (x y : ℕ) (hx : succ x ≤ succ y) : x ≤ y := by
  obtain ⟨d, hd⟩ := hx
  refine ⟨d, ?_⟩
  rewrite [succ_add] at hd
  have hd := succ_inj hd
  exact hd

end MyNat
