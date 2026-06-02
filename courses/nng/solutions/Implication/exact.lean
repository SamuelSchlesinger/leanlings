-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Power.add_sq

namespace MyNat

/- Assuming $x+y=37$ and $3x+z=42$, we have $x+y=37$. -/
example (x y z : ℕ) (h1 : x + y = 37) (h2 : 3 * x + z = 42) : x + y = 37 := by
  exact h1

end MyNat
