-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.twoaddtwo

namespace MyNat

/-- For all natural numbers $n$, we have $0 + n = n$. -/
theorem zero_add (n : ℕ) : 0 + n = n := by
  induction n using MyNat.rec' with
  | zero =>
    rewrite [add_zero]
    rfl
  | succ d hd =>
    rewrite [add_succ]
    rewrite [hd]
    rfl

end MyNat
