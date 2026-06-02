-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Addition.succ_add

namespace MyNat

/-- On the set of natural numbers, addition is commutative.
In other words, if `a` and `b` are arbitrary natural numbers, then
$a + b = b + a$. -/
theorem add_comm (a b : ℕ) : a + b = b + a := by
  induction b with d hd
  · rewrite [add_zero, zero_add]
    rfl
  · rewrite [add_succ, succ_add, hd]
    rfl

end MyNat
