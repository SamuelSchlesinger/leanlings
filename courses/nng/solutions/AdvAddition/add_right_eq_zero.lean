-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvAddition.add_right_eq_self

namespace MyNat

/-- If $a+b=0$ then $a=0$. -/
theorem add_right_eq_zero (a b : ℕ) : a + b = 0 → a = 0 := by
  cases b using MyNat.casesOn' with
  | zero =>
    intro h
    rewrite [add_zero] at h
    exact h
  | succ d =>
    intro h
    rewrite [add_succ] at h
    exact False.elim (zero_ne_succ (a + d) h.symm)

end MyNat
