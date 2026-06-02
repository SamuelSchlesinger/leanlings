-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Addition.zero_add

namespace MyNat

/--
For all natural numbers $a, b$, we have
$ \operatorname{succ}(a) + b = \operatorname{succ}(a + b)$.
-/
theorem succ_add (a b : ℕ) : succ a + b = succ (a + b) := by
  induction b with d hd
  · rewrite [add_zero]
    rewrite [add_zero]
    rfl
  ·
    rewrite [add_succ, add_succ, hd]
    rfl

end MyNat
