-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.intro2

namespace MyNat

/-
We still can't prove `2 + 2 ≠ 5` because we have not talked about the
definition of `≠`. In Lean, `a ≠ b` is *notation* for `a = b → False`.
Here `False` is a generic false proposition, and `→` is Lean's notation
for "implies". In logic we learn
that `True → False` is false, but `False → False` is true. Hence
`X → False` is the logical opposite of `X`.

Even though `a ≠ b` does not look like an implication,
you should treat it as an implication. The next two levels will show you how.

`False` is a goal which you cannot deduce from a consistent set of assumptions!
So if your goal is `False` then you had better hope that your hypotheses
are contradictory, which they are in this level.
-/
/- If $x=y$ and $x \neq y$ then we can deduce a contradiction. -/
example (x y : ℕ) (h1 : x = y) (h2 : x ≠ y) : False := by
  sorry

end MyNat
