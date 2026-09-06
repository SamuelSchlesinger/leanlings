-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.succ_ne_succ

namespace MyNat

/- $20+20=40$. -/
theorem exercise_algorithm_decide : (20 : ℕ) + 20 = 40 := by
  simp only [ofNat_succ, add_succ, add_zero]

end MyNat
