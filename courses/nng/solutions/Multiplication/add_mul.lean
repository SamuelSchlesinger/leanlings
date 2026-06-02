-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.mul_add

namespace MyNat

/-- Addition is distributive over multiplication.
In other words, for all natural numbers $a$, $b$ and $c$, we have
$(a + b) \times c = ac + bc$. -/
theorem add_mul
    (a b c : ℕ) : (a + b) * c = a * c + b * c := by
  rewrite [mul_comm, mul_add]
  repeat rewrite [mul_comm c]
  rfl

end MyNat
