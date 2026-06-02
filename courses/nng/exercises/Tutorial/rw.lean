-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.rfl

namespace MyNat

/-
In this level the *goal* is $2y=2(x+7)$ but to help us we
have an *assumption* `h` saying that $y = x + 7$. Check that you can see `h` in
your list of assumptions. Lean thinks of `h` as being a secret proof of the
assumption, rather like `x` is a secret number.

Before we can use `rfl`, we have to "substitute in for $y$".
We do this in Lean by *rewriting* the goal with `h`,
using the `rw` tactic.
-/
/- If $x$ and $y$ are natural numbers, and $y = x + 7$, then $2y = 2(x + 7)$. -/
example
    (x y : ℕ) (h : y = x + 7) : 2 * y = 2 * (x + 7) := by
  sorry

end MyNat
