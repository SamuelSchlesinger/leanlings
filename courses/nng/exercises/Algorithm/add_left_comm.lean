-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_right_eq_self

namespace MyNat

/-
Having to rearrange variables manually using commutativity and
associativity is very tedious. We start by reminding you of this. `add_left_comm`
is a key component in the first algorithm which we'll explain, but we need
to prove it manually.

Remember that you can do precision commutativity rewriting
with things like `rw [add_comm b c]`. And remember that
`a + b + c` means `(a + b) + c`.
-/
/-- If $a, b, c$ are numbers, then $a+(b+c)=b+(a+c)$. -/
theorem add_left_comm (a b c : ℕ) : a + (b + c) = b + (a + c) := by
  sorry

end MyNat
