-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.zero_pow_succ

namespace MyNat

/-- For all naturals $a$, $a ^ 1 = a$. -/
theorem pow_one (a : ℕ) : a ^ 1 = a := by
  rewrite [one_eq_succ_zero]
  rewrite [pow_succ]
  rewrite [pow_zero]
  rewrite [one_mul]
  rfl

end MyNat
