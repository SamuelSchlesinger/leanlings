-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvAddition.add_left_eq_zero

namespace MyNat

/-
`a ≤ b` is *notation* for `∃ c, b = a + c`. This "backwards E"
means "there exists". So `a ≤ b` means that there exists
a number `c` such that `b = a + c`. This definition works
because there are no negative numbers in this game.

To *prove* an "exists" statement, use the `use` tactic.
Let's see an example.
-/
/-- If $x$ is a number, then $x \le x$. -/
theorem le_refl (x : ℕ) : x ≤ x := by
  sorry

end MyNat
