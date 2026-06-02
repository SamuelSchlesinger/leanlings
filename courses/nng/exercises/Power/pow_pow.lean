-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.mul_pow

namespace MyNat

/-
One of the best named levels in the game, a savage `pow_pow`
sub-boss appears as the music reaches a frenzy. What
else could there be to prove about powers after this?
-/
/-- For all naturals $a$, $m$, $n$, we have $(a ^ m) ^ n = a ^ {mn}$. -/
theorem pow_pow
    (a m n : ℕ) : (a ^ m) ^ n = a ^ (m * n) := by
  sorry

end MyNat
