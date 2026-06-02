-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.add_algo1

namespace MyNat

/-
Lean's simplifier, `simp`, is "`rw` on steroids". It will rewrite every lemma
tagged with `simp` and every lemma fed to it by the user, as much as it can.

This level is not a level which you want to solve by hand.
Get the simplifier to solve it for you.
-/
/- If $a, b,\ldots h$ are arbitrary natural numbers, we have
$(d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h$. -/
example (a b c d e f g h : ℕ) :
    (d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h := by
  sorry

end MyNat
