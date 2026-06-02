-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.add_algo3

namespace MyNat

/-
We now start work on an algorithm to do addition more efficiently. Recall that
we defined addition by recursion, saying what it did on `0` and successors.
It is an axiom of Lean that recursion is a valid
way to define functions from types such as the naturals.

Let's define a new function `pred` from the naturals to the naturals, which
attempts to subtract 1 from the input. The definition is this:

```
pred 0 := 37
pred (succ n) := n
```

We cannot subtract one from 0, so we just return a junk value. As well as this
definition, we also create a new lemma `pred_succ`, which says that `pred (succ n) = n`.
Let's use this lemma to prove `succ_inj`, the theorem which
Peano assumed as an axiom and which we have already used extensively without justification.
-/
/- If $\operatorname{succ}(a)=\operatorname{succ}(b)$ then $a=b$. -/
example (a b : ℕ) (h : succ a = succ b) : a = b := by
  sorry

end MyNat
