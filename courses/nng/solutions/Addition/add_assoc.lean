-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Addition.add_comm

namespace MyNat

/-- On the set of natural numbers, addition is associative.
In other words, if $a, b$ and $c$ are arbitrary natural numbers, we have
$ (a + b) + c = a + (b + c). $ -/
theorem add_assoc (a b c : ℕ) : a + b + c = a + (b + c) := by
  induction c with d hd
  · rewrite [add_zero, add_zero]
    rfl
  · rewrite [add_succ, add_succ, hd, add_succ]
    rfl

end MyNat
