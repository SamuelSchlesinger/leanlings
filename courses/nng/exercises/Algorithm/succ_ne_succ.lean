-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.succ_ne_zero

namespace MyNat

/-
Here we begin to
develop an algorithm which, given two naturals `a` and `b`, returns the answer
to "does `a = b`?"

Here is the algorithm. First note that `a` and `b` are numbers, and hence
are either `0` or successors.

*) If `a` and `b` are both `0`, return "yes".

*) If one is `0` and the other is `succ n`, return "no".

*) If `a = succ m` and `b = succ n`, then return the answer to "does `m = n`?"

Our job now is to *prove* that this algorithm always gives the correct answer. The proof that
`0 = 0` is `rfl`. The proof that `0 ≠ succ n` is `zero_ne_succ n`, and the proof
that `succ m ≠ 0` is `succ_ne_zero m`. The proof that if `h : m = n` then
`succ m = succ n` is `rw [h]` and then `rfl`. This level is a proof of the one
remaining job we have to do: if `a ≠ b` then `succ a ≠ succ b`.
-/
/-- If $a \neq b$ then $\operatorname{succ}(a) \neq\operatorname{succ}(b)$. -/
theorem succ_ne_succ (m n : ℕ) (h : m ≠ n) : succ m ≠ succ n := by
  sorry

end MyNat
