-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Addition.add_right_comm

namespace MyNat

/-- For any natural number $m$, we have $ m \times 1 = m$. -/
theorem mul_one (m : ℕ) : m * 1 = m := by
  rewrite [one_eq_succ_zero]
  rewrite [mul_succ]
  rewrite [mul_zero]
  rewrite [zero_add]
  rfl

end MyNat
