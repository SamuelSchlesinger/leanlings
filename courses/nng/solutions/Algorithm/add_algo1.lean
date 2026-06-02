-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Algorithm.add_left_comm

namespace MyNat

/- If $a, b$, $c$ and $d$ are numbers, we have
$(a + b) + (c + d) = ((a + c) + d) + b.$ -/
example (a b c d : ℕ) : a + b + (c + d) = a + c + d + b := by
  repeat rewrite [add_assoc]
  rewrite [add_left_comm b c]
  rewrite [add_comm b d]
  rfl

end MyNat
