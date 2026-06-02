-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.two_eq_ss0

namespace MyNat

/- $2$ is the number after the number after $0$. -/
example : 2 = succ (succ 0) := by
  rewrite [← one_eq_succ_zero]
  rewrite [← two_eq_succ_one]
  rfl

end MyNat
