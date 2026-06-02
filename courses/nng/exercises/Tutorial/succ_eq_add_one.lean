-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.add_zero2

namespace MyNat

/-
Every number in Lean is either $0$ or a successor. We know how to add $0$,
but we need to figure out how to add successors. Let's say we already know
that `37 + d = q`. What should the answer to `37 + succ d` be? Well,
`succ d` is one bigger than `d`, so `37 + succ d` should be `succ q`,
the number one bigger than `q`. More generally `x + succ d` should
be `succ (x + d)`. Let's add this as a lemma.

* `add_succ x d : x + succ d = succ (x + d)`

If you ever see `... + succ ...` in your goal, `rw [add_succ]` is
normally a good idea.

Let's now prove that `succ n = n + 1`. Figure out how to get `+ succ` into
the picture, and then `rw [add_succ]`.
-/
/-- For all natural numbers $a$, we have $\operatorname{succ}(a) = a+1$. -/
theorem succ_eq_add_one n : succ n = n + 1 := by
  sorry

end MyNat
