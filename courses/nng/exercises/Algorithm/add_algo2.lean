-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.add_algo1

namespace MyNat

/-
Lean's simplifier, `simp`, repeatedly applies simplification rules.
`simp only [lemma1, lemma2]` selects a small set of rules, which makes it
easier to understand what a proof depends on. For a rule like commutativity,
Lean uses an ordering on expressions to avoid swapping the same terms forever.

This level is not a level which you want to solve by hand.
Get the simplifier to solve it for you.
-/
/- If $a, b,\ldots h$ are arbitrary natural numbers, we have
$(d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h$. -/
theorem exercise_algorithm_add_algo2 (a b c d e f g h : ℕ) :
    (d + f) + (h + (a + c)) + (g + e + b) = a + b + c + d + e + f + g + h := by
  sorry

end MyNat
