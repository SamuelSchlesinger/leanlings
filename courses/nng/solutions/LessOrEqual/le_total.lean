-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.or_symm

namespace MyNat

/-- If $x$ and $y$ are numbers, then either $x \leq y$ or $y \leq x$. -/
theorem le_total (x y : ℕ) : x ≤ y ∨ y ≤ x := by
  induction y with d hd
  right
  exact zero_le x
  cases hd with h1 h2
  left
  cases h1 with e h1
  rewrite [h1]
  use e + 1
  rewrite [succ_eq_add_one, add_assoc]
  rfl
  cases h2 with e he
  cases e with a
  rewrite [he]
  left
  rewrite [add_zero]
  use 1
  exact succ_eq_add_one d
  right
  use a
  rewrite [add_succ] at he
  rewrite [succ_add]
  exact he

end MyNat
