-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.le_two

namespace MyNat

theorem mul_le_mul_right (a b t : ℕ) (h : a ≤ b) : a * t ≤ b * t := by
  obtain ⟨d, hd⟩ := h
  refine ⟨d * t, ?_⟩
  rewrite [hd, add_mul]
  rfl

end MyNat
