-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.zero_ne_one

namespace MyNat

/-
We know `zero_ne_succ n` is a proof of `0 = succ n → False` -- but what
if we have a hypothesis `succ n = 0`? It's the wrong way around!

The `symm` tactic changes a goal `x = y` to `y = x`, and a goal `x ≠ y`
to `y ≠ x`. And `symm at h`
does the same for a hypothesis `h`. We've proved $0 \
eq 1$ and called
the proof `zero_ne_one`; now try proving $1 \
eq 0$.
-/
/-- $1\neq0$. -/
theorem one_ne_zero : (1 : ℕ) ≠ 0 := by
  sorry

end MyNat
