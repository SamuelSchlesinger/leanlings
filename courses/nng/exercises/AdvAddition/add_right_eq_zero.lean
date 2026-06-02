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

For example, sometimes you want to deal with the two cases `b = 0` and `b = succ d` separately,
but don't need the inductive hypothesis `hd` that comes with `induction b with d hd`.
In this situation you can use `cases b with d` instead. There are two ways to make
a number: it's either zero or a successor. So you will end up with two goals, one
with `b = 0` and one with `b = succ d`.

Another example: if you have a hypothesis `h : False` then you are done, because a false statement implies
any statement. Here `cases h` will close the goal, because there are *no* ways to
make a proof of `False`! So you will end up with no goals, meaning you have proved everything.
-/
/-- If $a+b=0$ then $a=0$. -/
theorem add_right_eq_zero (a b : ℕ) : a + b = 0 → a = 0 := by
  sorry

end MyNat
