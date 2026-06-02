-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.two_add_two_ne_five

namespace MyNat

/-
In this world I will mostly leave you on your own.

`add_right_cancel a b n` is the theorem that $a+n=b+n\implies a=b$.
-/
/-- $a+n=b+n\implies a=b$. -/
theorem add_right_cancel (a b n : ℕ) : a + n = b + n → a = b := by
  sorry

end MyNat
