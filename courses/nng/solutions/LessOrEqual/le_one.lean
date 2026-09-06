-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.succ_le_succ

namespace MyNat

/-- If $x \leq 1$ then either $x = 0$ or $x = 1$. -/
theorem le_one (x : ℕ) (hx : x ≤ 1) : x = 0 ∨ x = 1 := by
  cases x using MyNat.casesOn' with
  | zero => exact Or.inl rfl
  | succ y =>
    rewrite [one_eq_succ_zero] at hx ⊢
    have hy := succ_le_succ _ _ hx
    have hy0 := le_zero _ hy
    rewrite [hy0]
    exact Or.inr rfl

end MyNat
