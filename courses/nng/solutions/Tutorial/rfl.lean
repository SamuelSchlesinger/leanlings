-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import MyNatLib.Prelude

namespace MyNat

/- If $x$ and $q$ are arbitrary natural numbers, then $37x+q=37x+q.$ -/
example
    (x q : ℕ) : 37 * x + q = 37 * x + q := by
  rfl

end MyNat
