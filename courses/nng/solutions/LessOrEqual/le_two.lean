-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_one

namespace MyNat

/-- If $x \leq 2$ then $x = 0$ or $1$ or $2$. -/
theorem le_two (x : ℕ) (hx : x ≤ 2) : x = 0 ∨ x = 1 ∨ x = 2 := by
  cases x using MyNat.casesOn' with
  | zero => exact Or.inl rfl
  | succ y =>
    rewrite [two_eq_succ_one] at hx
    have hy := succ_le_succ _ _ hx
    rcases le_one y hy with hy0 | hy1
    · right
      left
      rewrite [hy0, one_eq_succ_zero]
      rfl
    · right
      right
      rewrite [hy1, two_eq_succ_one]
      rfl

end MyNat
