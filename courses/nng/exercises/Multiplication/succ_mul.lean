-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.zero_mul

namespace MyNat

/-
Similarly we have `mul_succ`
but we're going to need `succ_mul` (guess what it says -- maybe you
are getting the hang of Lean's naming conventions).

A lemma from Addition World might help you here.
-/
/-- For all natural numbers $a$ and $b$, we have
$(\operatorname{succ}\ a) \times b = a\times b + b$. -/
theorem succ_mul
    (a b : ℕ) : succ a * b = a * b + b := by
  sorry

end MyNat
