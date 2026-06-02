-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.pow_two

namespace MyNat

/-- For all naturals $a$, $m$, $n$, we have $a^{m + n} = a ^ m  a ^ n$. -/
theorem pow_add
    (a m n : ℕ) : a ^ (m + n) = a ^ m * a ^ n := by
  induction n with t ht
  · rewrite [add_zero, pow_zero, mul_one]
    rfl
  · rewrite [add_succ, pow_succ, pow_succ, ht, mul_assoc]
    rfl

end MyNat
