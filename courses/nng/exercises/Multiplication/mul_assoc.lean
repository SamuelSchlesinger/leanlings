-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.add_mul

namespace MyNat

/-
We now have enough to prove that multiplication is associative,
the boss level of multiplication world. Good luck!
-/
/-- Multiplication is associative.
In other words, for all natural numbers $a$, $b$ and $c$, we have
$(ab)c = a(bc)$. -/
theorem mul_assoc
    (a b c : ℕ) : (a * b) * c = a * (b * c) := by
  sorry

end MyNat
