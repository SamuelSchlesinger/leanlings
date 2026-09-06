-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.add_algo3

namespace MyNat

/-
We now study why the basic facts about `0` and `succ` hold for an inductive
type. Such a type comes with a recursion principle: define the result on
each constructor, using recursive results on its smaller components.

Let's define a new function `pred` from the naturals to the naturals, which
attempts to subtract 1 from the input. The definition is this:

```
pred 0 := 37
pred (succ n) := n
```

We cannot subtract one from 0, so we just return a junk value. As well as this
definition, we also create a new lemma `pred_succ`, which says that `pred (succ n) = n`.
Let's use this lemma to give another proof of successor injectivity.
The foundation supplied a proof earlier; here you reconstruct the reasoning.
-/
/- If $\operatorname{succ}(a)=\operatorname{succ}(b)$ then $a=b$. -/
theorem exercise_algorithm_pred (a b : ℕ) (h : succ a = succ b) : a = b := by
  sorry

end MyNat
