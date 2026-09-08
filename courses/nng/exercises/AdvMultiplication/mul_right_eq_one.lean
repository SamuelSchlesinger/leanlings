-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.le_mul_right

namespace MyNat

/-
This level proves `x * y = 1 → x = 1`, the multiplicative analogue of Advanced Addition
World's `x + y = 0 → x = 0`. The strategy is to prove that `x ≤ 1` and then use the
lemma `le_one` from `≤` world.

It helps to name intermediate facts with `have name : statement := by ...`.
First prove that the product is nonzero, then use that proof to bound `x`.
Each `have` requires its own proof; it does not add an assumption for free.
-/
theorem mul_right_eq_one (x y : ℕ) (h : x * y = 1) : x = 1 := by
  sorry

end MyNat
