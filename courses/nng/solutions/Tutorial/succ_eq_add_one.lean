-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.add_zero2

namespace MyNat

/-- For all natural numbers $a$, we have $\operatorname{succ}(a) = a+1$. -/
theorem succ_eq_add_one n : succ n = n + 1 := by
  rewrite [one_eq_succ_zero]
  rewrite [add_succ]
  rewrite [add_zero]
  rfl

end MyNat
