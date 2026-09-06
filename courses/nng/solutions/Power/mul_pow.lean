-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.pow_add

namespace MyNat

/-- For all naturals $a$, $b$, $n$, we have $(ab) ^ n = a ^ nb ^ n$. -/
theorem mul_pow
    (a b n : ℕ) : (a * b) ^ n = a ^ n * b ^ n := by
  induction n using MyNat.rec' with
  | zero =>
    rewrite [pow_zero, pow_zero, pow_zero, mul_one]
    rfl
  | succ t Ht =>
    rewrite [pow_succ, pow_succ, pow_succ, Ht]
    -- simp
    repeat rewrite [mul_assoc]
    rewrite [mul_comm a (_ * b), mul_assoc, mul_comm b a]
    rfl

end MyNat
