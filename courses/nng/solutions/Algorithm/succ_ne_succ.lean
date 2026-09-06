-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.succ_ne_zero

namespace MyNat

/-- If $a \neq b$ then $\operatorname{succ}(a) \neq\operatorname{succ}(b)$. -/
theorem succ_ne_succ (m n : ℕ) (h : m ≠ n) : succ m ≠ succ n := by
  intro hs
  have hs := succ_inj hs
  exact h hs

end MyNat
