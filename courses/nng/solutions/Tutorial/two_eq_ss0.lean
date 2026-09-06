-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.rw

namespace MyNat

/- $2$ is the number after the number after $0$. -/
theorem exercise_tutorial_two_eq_ss0
    : 2 = succ (succ 0) := by
  rewrite [two_eq_succ_one]
  rewrite [one_eq_succ_zero]
  rfl

end MyNat
