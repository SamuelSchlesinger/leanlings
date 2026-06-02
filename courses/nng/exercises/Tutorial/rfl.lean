-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import MyNatLib.Prelude

namespace MyNat

/-
# Read this first

Each level in this game involves proving a mathematical theorem (the "Goal").
The goal will be a statement about *numbers*. Some numbers in this game have known values.
Those numbers have names like $37$. Other numbers will be secret. They're called things
like $x$ and $q$. We know $x$ is a number, we just don't know which one.

In this first level we're going to prove the theorem that $37x + q = 37x + q$.
You can see `x q : ℕ` in the *Objects* below, which means that `x` and `q`
are numbers.

We solve goals in Lean using *Tactics*, and the first tactic we're
going to learn is called `rfl`, which proves all theorems of the form $X = X$.

Prove that $37x+q=37x+q$ by executing the `rfl` tactic.
-/
/- If $x$ and $q$ are arbitrary natural numbers, then $37x+q=37x+q.$ -/
example
    (x q : ℕ) : 37 * x + q = 37 * x + q := by
  sorry

end MyNat
