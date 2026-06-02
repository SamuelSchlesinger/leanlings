-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Addition.add_right_comm

namespace MyNat

/-
See the new "*" tab in your lemmas, containing `mul_zero` and `mul_succ`.
Right now these are the only facts we know about multiplication.
Let's prove nine more.

Let's start with a warm-up: no induction needed for this one,
because we know `1` is a successor.
-/
/-- For any natural number $m$, we have $ m \times 1 = m$. -/
theorem mul_one (m : ℕ) : m * 1 = m := by
  sorry

end MyNat
