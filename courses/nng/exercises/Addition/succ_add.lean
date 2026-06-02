-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Addition.zero_add

namespace MyNat

/-
Oh no! On the way to `add_comm`, a wild `succ_add` appears. `succ_add a b`
is the proof that `(succ a) + b = succ (a + b)` for `a` and `b` numbers.
This result is what's standing in the way of `x + y = y + x`. Again
we have the problem that we are adding `b` to things, so we need
to use induction to split into the cases where `b = 0` and `b` is a successor.
-/
/--
For all natural numbers $a, b$, we have
$ \operatorname{succ}(a) + b = \operatorname{succ}(a + b)$.
-/
theorem succ_add (a b : ℕ) : succ a + b = succ (a + b) := by
  sorry

end MyNat
