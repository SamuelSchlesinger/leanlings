-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.twoaddtwo

namespace MyNat

/-
In this level we're going to prove that $0+n=n$, where $n$ is a secret natural number.

Wait, don't we already know that? No! We know that $n+0=n$, but that's `add_zero`.
This is `zero_add`, which is different.

The difficulty with proving `0 + n = n` is that we do not have a *formula* for
`0 + n` in general, we can only use `add_zero` and `add_succ` once
we know whether `n` is `0` or a successor. The `induction` tactic splits into these two cases.

The base case will require us to prove `0 + 0 = 0`, and the inductive step
will ask us to show that if `0 + d = d` then `0 + succ d = succ d`. Because
`0` and successor are the only way to make numbers, this will cover all the cases.

Use this outline, filling each hole separately:

    induction n using MyNat.rec' with
    | zero => sorry
    | succ d hd => sorry

In the second branch, `hd : 0 + d = d` is available. First use `add_succ`
to expose `0 + d`, then use `hd`. `MyNat.rec'` is the induction principle
for our copy of the naturals, with its base case displayed as `0`.

The branch names keep the two obligations separate. Finish the zero case
before using the induction hypothesis in the successor case.
-/
/-- For all natural numbers $n$, we have $0 + n = n$. -/
theorem zero_add (n : ℕ) : 0 + n = n := by
  sorry

end MyNat
