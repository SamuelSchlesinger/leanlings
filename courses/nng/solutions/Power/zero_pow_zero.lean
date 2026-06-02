-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.mul_assoc

namespace MyNat

/-- $0 ^ 0 = 1$ -/
theorem zero_pow_zero : (0 : ℕ) ^ 0 = 1 := by
  rewrite [pow_zero]
  rfl

end MyNat
