-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvAddition.add_left_eq_zero

namespace MyNat

/-- If $x$ is a number, then $x \le x$. -/
theorem le_refl (x : ℕ) : x ≤ x := by
  refine ⟨0, ?_⟩
  rewrite [add_zero]
  rfl

end MyNat
