-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.pow_pow

namespace MyNat

/-- For all numbers $a$ and $b$, we have
$$(a+b)^2=a^2+b^2+2ab.$$ -/
theorem add_sq
    (a b : ℕ) : (a + b) ^ 2 = a ^ 2 + b ^ 2 + 2 * a * b := by
  rewrite [pow_two, pow_two, pow_two]
  rewrite [add_right_comm]
  rewrite [mul_add, add_mul, add_mul]
  rewrite [two_mul, add_mul]
  rewrite [mul_comm b a]
  rewrite [← add_assoc, ← add_assoc]
  rfl

end MyNat
