-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.apply

namespace MyNat

/-
If `h : succ a = succ b`, then `succ_inj h : a = b`.
Lean infers the two numbers from the type of `h`.

Peano had this theorem as an axiom, but in Algorithm World
we will explore its proof using a predecessor function. The foundation
already proves it for our inductive `MyNat`. Here, use the theorem
to prove $x+1=4 \implies x=3$ by rewriting the hypothesis until
`succ_inj` applies. Request a hint if you need a first rewrite.
-/
/- If $x+1=4$ then $x=3$. -/
theorem exercise_implication_succ_inj (x : ℕ) (h : x + 1 = 4) : x = 3 := by
  sorry

end MyNat
