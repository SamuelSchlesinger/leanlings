-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.mul_pow

namespace MyNat

/-- For all naturals $a$, $m$, $n$, we have $(a ^ m) ^ n = a ^ {mn}$. -/
theorem pow_pow
    (a m n : ℕ) : (a ^ m) ^ n = a ^ (m * n) := by
  induction n using MyNat.rec' with
  | zero =>
    rewrite [mul_zero, pow_zero, pow_zero]
    rfl
  | succ t Ht =>
    rewrite [pow_succ, Ht, mul_succ, pow_add]
    rfl

end MyNat
