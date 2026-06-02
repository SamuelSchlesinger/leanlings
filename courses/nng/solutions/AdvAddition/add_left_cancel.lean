-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvAddition.add_right_cancel

namespace MyNat

/-- $n+a=n+b\implies a=b$. -/
theorem add_left_cancel (a b n : ℕ) : n + a = n + b → a = b := by
  repeat rewrite [add_comm n]
  intro h
  apply add_right_cancel at h
  exact h

end MyNat
