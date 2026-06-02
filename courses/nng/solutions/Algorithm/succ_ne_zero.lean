-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.pred

namespace MyNat

/-- $\operatorname{succ}(a) \neq 0$. -/
theorem succ_ne_zero (a : ℕ) : succ a ≠ 0 := by
  intro h
  rewrite [← is_zero_succ a]
  rewrite [h]
  rewrite [is_zero_zero]
  trivial

end MyNat
