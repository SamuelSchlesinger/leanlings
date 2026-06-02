-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Tutorial.rw_backwards

namespace MyNat

/- $a+(b+0)+(c+0)=a+b+c.$ -/
example (a b c : ℕ) : a + (b + 0) + (c + 0) = a + b + c := by
  rewrite [add_zero]
  rewrite [add_zero]
  rfl

end MyNat
