-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvAddition.add_right_eq_self

namespace MyNat

/-
The next result we'll need in `≤` World is that if `a + b = 0` then `a = 0` and `b = 0`.
Let's prove one of these facts in this level, and the other in the next.

## A new tactic: `cases`

The `cases` tactic will split an object or hypothesis up into the possible ways
that it could have been created.

Sometimes you only need to distinguish zero from a successor, without a
proof about the predecessor. Use this outline:

    cases b using MyNat.casesOn' with
    | zero => sorry
    | succ d => sorry

The zero branch substitutes `0` for `b`; the successor branch substitutes
`succ d`. Unlike induction, case analysis supplies no induction hypothesis.
The course's `casesOn'` principle displays zero as the numeral `0`, so
the arithmetic equations match the base case directly.

Another example: if you have a hypothesis `h : False` then you are done, because a false statement implies
any statement. Here `cases h` will close the goal, because there are *no* ways to
make a proof of `False`! So you will end up with no goals, meaning you have proved everything.
-/
/-- If $a+b=0$ then $a=0$. -/
theorem add_right_eq_zero (a b : ℕ) : a + b = 0 → a = 0 := by
  sorry

end MyNat
