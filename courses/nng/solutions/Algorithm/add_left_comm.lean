-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_right_eq_self

namespace MyNat

/-- If $a, b, c$ are numbers, then $a+(b+c)=b+(a+c)$. -/
theorem add_left_comm (a b c : ℕ) : a + (b + c) = b + (a + c) := by
  rewrite [← add_assoc]
  rewrite [add_comm a b]
  rewrite [add_assoc]
  rfl

end MyNat
