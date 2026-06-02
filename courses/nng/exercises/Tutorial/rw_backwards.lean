-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.two_eq_ss0

namespace MyNat

/-
If `h` is a proof of `X = Y` then `rw [h]` will
turn `X`s into `Y`s. But what if we want to
turn `Y`s into `X`s? To tell the `rw` tactic
we want this, we use a left arrow `←`. Type
`\l` and then hit the space bar to get this arrow.

Let's prove that $2$ is the number after the number
after $0$ again, this time by changing `succ (succ 0)`
into `2`.
-/
/- $2$ is the number after the number after $0$. -/
example : 2 = succ (succ 0) := by
  sorry

end MyNat
