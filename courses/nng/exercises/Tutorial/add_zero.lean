-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.rw_backwards

namespace MyNat

/-
We'd like to prove `2 + 2 = 4` but right now
we can't even *state* it
because we haven't yet defined addition.

## Defining addition.

How are we going to add $37$ to an arbitrary number $x$? Well,
there are only two ways to make numbers in this game: $0$
and successors. So to define `37 + x` we will need
to know what `37 + 0` is and what `37 + succ x` is.
Let's start with adding `0`.

### Adding 0

To make addition agree with our intuition, we should *define* `37 + 0`
to be `37`. More generally, we should define `a + 0` to be `a` for
any number `a`. The name of this proof in Lean is `add_zero a`.
For example `add_zero 37` is a proof of `37 + 0 = 37`,
`add_zero x` is a proof of `x + 0 = x`, and `add_zero` is a proof
of `? + 0 = ?`.

We write `add_zero x : x + 0 = x`, so `proof : statement`.
-/
/- $a+(b+0)+(c+0)=a+b+c.$ -/
example (a b c : ℕ) : a + (b + 0) + (c + 0) = a + b + c := by
  sorry

end MyNat
