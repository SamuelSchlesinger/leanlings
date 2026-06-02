-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.apply

namespace MyNat

/-
If `a` and `b` are numbers, then `succ_inj a b` is a proof
that `succ a = succ b` implies `a = b`. Click on this theorem in the *Peano*
tab for more information.

Peano had this theorem as an axiom, but in Algorithm World
we will show how to prove it in Lean. Right now let's just assume it,
and let's prove $x+1=4 \implies x=3$ using it. Again, we will proceed
by manipulating our hypothesis until it becomes the goal. I will
walk you through this level.
-/
/- If $x+1=4$ then $x=3$. -/
example (x : ℕ) (h : x + 1 = 4) : x = 3 := by
  sorry

end MyNat
