-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.decide

namespace MyNat

/-
We gave a pretty unsatisfactory proof of `2 + 2 ≠ 5` earlier on; now give a nicer one.
-/
/- $2+2 \neq 5.$ -/
theorem exercise_algorithm_decide2 : (2 : ℕ) + 2 ≠ 5 := by
  sorry

end MyNat
