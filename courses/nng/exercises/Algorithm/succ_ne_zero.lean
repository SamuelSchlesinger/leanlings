-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.pred

namespace MyNat

/-
We define a function `is_zero` thus:

```
is_zero 0 := True
is_zero (succ n) := False
```

We also create two lemmas, `is_zero_zero` and `is_zero_succ n`, saying that `is_zero 0 = True`
and `is_zero (succ n) = False`. Let's use these lemmas to prove `succ_ne_zero`, Peano's
Last Axiom. Actually, we have been using `zero_ne_succ` before, but it's handy to have
this opposite version too, which can be proved in the same way. Note: you can
cheat here by using `zero_ne_succ` but the point of this world is to show
you how to *prove* results like that.

If you can turn your goal into `True`, then the `trivial` tactic will solve it.
-/
/-- $\operatorname{succ}(a) \neq 0$. -/
theorem succ_ne_zero (a : ℕ) : succ a ≠ 0 := by
  sorry

end MyNat
