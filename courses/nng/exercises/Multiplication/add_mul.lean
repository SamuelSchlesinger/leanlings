-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.mul_add

namespace MyNat

/-
`add_mul` is just as fiddly to prove by induction; but there's a trick
which avoids it. Can you spot it?
-/
/-- Multiplication distributes over addition on the right.
In other words, for all natural numbers $a$, $b$ and $c$, we have
$(a + b) \times c = ac + bc$. -/
theorem add_mul
    (a b c : ℕ) : (a + b) * c = a * c + b * c := by
  sorry

end MyNat
