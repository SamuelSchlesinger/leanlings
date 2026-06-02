-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.zero_pow_zero

namespace MyNat

/-
We've just seen that `0 ^ 0 = 1`, but if `n`
is a successor, then `0 ^ n = 0`. We prove that here.
-/
/-- For all numbers $m$, $0 ^{\operatorname{succ} (m)} = 0$. -/
theorem zero_pow_succ
    (m : ℕ) : (0 : ℕ) ^ (succ m) = 0 := by
  sorry

end MyNat
