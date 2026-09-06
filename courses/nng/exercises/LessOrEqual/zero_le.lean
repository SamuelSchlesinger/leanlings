-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_refl

namespace MyNat

/-
To solve this level, choose a number `c` with `refine ⟨c, ?_⟩` such that `x = 0 + c`.
-/
/-- If $x$ is a number, then $0 \le x$. -/
theorem zero_le (x : ℕ) : 0 ≤ x := by
  sorry

end MyNat
