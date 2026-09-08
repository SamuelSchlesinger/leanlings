-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_antisymm

namespace MyNat

/-
Totality of `≤` is the boss level of this world, and it's coming up next. It says that
if `a` and `b` are naturals then either `a ≤ b` or `b ≤ a`.
But we haven't talked about `or` at all. Here's a run-through.

1) The notation for "or" is `∨`. You won't need to type it, but you can
type it with `\or`.

2) If you have an "or" statement in the *goal*, then two tactics make
progress: `left` and `right`. But don't choose a direction unless your
hypotheses guarantee that it's the correct one.

3) If you have an "or" statement as a *hypothesis* `h`, then
`rcases h with h1 | h2` will create two goals, one where you went left,
and the other where you went right.

After that split, write two `·` bullets (type `\cdot`), with an indented
proof under each. The first has `h1`; the second has `h2`. Use the available
evidence to choose which side of the goal to prove in each branch.
-/
/- If $x=37$ or $y=42$, then $y=42$ or $x=37$. -/
theorem exercise_lessorequal_or_symm (x y : ℕ) (h : x = 37 ∨ y = 42) : y = 42 ∨ x = 37 := by
  sorry

end MyNat
