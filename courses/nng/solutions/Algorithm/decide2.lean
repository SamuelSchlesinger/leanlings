-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.decide

namespace MyNat

/- $2+2 \neq 5.$ -/
example : (2 : ℕ) + 2 ≠ 5 := by
  simp only [ofNat_succ, add_succ, add_zero]
  decide

end MyNat
