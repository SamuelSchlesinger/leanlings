-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvAddition.add_right_cancel

namespace MyNat

/-
`add_left_cancel a b n` is the theorem that $n+a=n+b\implies a=b$.
You can prove it by induction on `n` or you can deduce it from `add_right_cancel`.
-/
/-- $n+a=n+b\implies a=b$. -/
theorem add_left_cancel (a b n : ℕ) : n + a = n + b → a = b := by
  sorry

end MyNat
