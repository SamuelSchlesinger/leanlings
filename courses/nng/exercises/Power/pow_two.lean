-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.one_pow

namespace MyNat

/-
Note: this lemma will be useful for the final boss!
-/
/-- For all naturals $a$, $a ^ 2 = a \times a$. -/
theorem pow_two
    (a : ℕ) : a ^ 2 = a * a := by
  sorry

end MyNat
