-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.zero_ne_one

namespace MyNat

/-
We know `zero_ne_succ n` is a proof of `0 = succ n → False` -- but what
if we have a hypothesis `succ n = 0`? It's the wrong way around!

An equality proof `h : succ n = 0` has a reversed proof
`h.symm : 0 = succ n`. Apply the appropriate zero-versus-successor
contradiction to that reversed equality. You can also use `Ne.symm` to
reverse a proved inequality such as `zero_ne_one`.
-/
/-- $1\neq0$. -/
theorem one_ne_zero : (1 : ℕ) ≠ 0 := by
  sorry

end MyNat
