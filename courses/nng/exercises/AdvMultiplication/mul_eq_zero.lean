-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_ne_zero

namespace MyNat

/-
This level proves that if `a * b = 0` then `a = 0` or `b = 0`. It is
the zero-product counterpart of the last level. Split on whether `a = 0`,
then, if necessary, whether `b = 0`. If neither is zero, the last theorem
contradicts `h`.

One way to make the first split is:

    rcases Classical.em (a = 0) with ha | ha
    · ...  -- ha : a = 0
    · ...  -- ha : a ≠ 0

`Classical.em P` proves `P ∨ ¬P` (excluded middle). Each `·` focuses one
branch. Within this course equality is also decidable, so `by_cases ha :
a = 0` is another way to make this split.
-/
theorem mul_eq_zero (a b : ℕ) (h : a * b = 0) : a = 0 ∨ b = 0 := by
  sorry

end MyNat
