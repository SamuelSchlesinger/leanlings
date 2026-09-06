-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Implication.succ_inj2

namespace MyNat

/- $x=37\implies x=37$. -/
theorem exercise_implication_intro (x : ℕ) : x = 37 → x = 37 := by
  intro h
  exact h

end MyNat
