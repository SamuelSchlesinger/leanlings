-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.one_pow

namespace MyNat

/-- For all naturals $a$, $a ^ 2 = a \times a$. -/
theorem pow_two
    (a : ℕ) : a ^ 2 = a * a := by
  rewrite [two_eq_succ_one]
  rewrite [pow_succ]
  rewrite [pow_one]
  rfl

end MyNat
