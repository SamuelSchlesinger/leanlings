-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.zero_le

namespace MyNat

/-- If $x$ is a number, then $x \le \operatorname{succ}(x)$. -/
theorem le_succ_self (x : ℕ) : x ≤ succ x := by
  refine ⟨1, ?_⟩
  rewrite [succ_eq_add_one]
  rfl

end MyNat
