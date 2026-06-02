-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.ne

namespace MyNat

/-- $0\neq1$. -/
theorem zero_ne_one : (0 : ℕ) ≠ 1 := by
  intro h
  rewrite [one_eq_succ_zero] at h  -- **TODO** this line is not needed :-/
  apply zero_ne_succ at h -- **TODO** cripple `apply`.
  exact h

end MyNat
