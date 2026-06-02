-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.pow_one

namespace MyNat

/-- For all naturals $m$, $1 ^ m = 1$. -/
theorem one_pow
    (m : ℕ) : (1 : ℕ) ^ m = 1 := by
  induction m with t ht
  · rewrite [pow_zero]
    rfl
  · rewrite [pow_succ]
    rewrite [ht]
    rewrite [mul_one]
    rfl

end MyNat
