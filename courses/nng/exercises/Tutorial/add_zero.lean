-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.rw_backwards

namespace MyNat

/-
We'd like to prove `2 + 2 = 4`. Addition notation is already available;
now we introduce the equations that let us prove facts about it.

## Defining addition.

How are we going to add $37$ to an arbitrary number $x$? Well,
there are only two ways to make numbers in this game: $0$
and successors. So to define `37 + x` we will need
to know what `37 + 0` is and what `37 + succ x` is.
Let's start with adding `0`.

### Adding 0

Our first addition axiom says `37 + 0 = 37`. More generally,
`a + 0 = a` for any number `a`. Its proof is named `add_zero a`.
For example `add_zero 37` is a proof of `37 + 0 = 37`,
`add_zero x` is a proof of `x + 0 = x`, and `add_zero` is a proof
of `? + 0 = ?`.

We write `add_zero x : x + 0 = x`, so `proof : statement`.
-/
/- $a+(b+0)+(c+0)=a+b+c.$ -/
theorem exercise_tutorial_add_zero (a b c : ℕ) : a + (b + 0) + (c + 0) = a + b + c := by
  sorry

end MyNat
