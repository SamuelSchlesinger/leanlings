-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.pow_two

namespace MyNat

/-
Let's now begin our approach to the final boss,
by proving some more subtle facts about powers.
-/
/-- For all naturals $a$, $m$, $n$, we have $a^{m + n} = a ^ m  a ^ n$. -/
theorem pow_add
    (a m n : ℕ) : a ^ (m + n) = a ^ m * a ^ n := by
  sorry

end MyNat
