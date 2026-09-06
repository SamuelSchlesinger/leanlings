-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.add_zero

namespace MyNat

/-
## Precision rewriting

In the last level, there was `b + 0` and `c + 0`,
and `rw [add_zero]` changed the first one it saw,
which was `b + 0`. Let's learn how to tell Lean
to change `c + 0` first by giving `add_zero` an
explicit input.
-/
/- $a+(b+0)+(c+0)=a+b+c.$ -/
theorem exercise_tutorial_add_zero2 (a b c : ℕ) : a + (b + 0) + (c + 0) = a + b + c := by
  sorry

end MyNat
