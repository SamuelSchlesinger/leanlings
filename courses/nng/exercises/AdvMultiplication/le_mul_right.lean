-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.one_le_of_ne_zero

namespace MyNat

/-
One day this game will have a Prime Number World, with a final boss
of proving that $2$ is prime.
To do this, we will have to rule out things like $2 = 37 × 42.$
We will do this by proving that any factor of $2$ is at most $2$,
which we will do using this lemma. The proof I have in mind manipulates the hypothesis
until it becomes the goal, using `mul_left_ne_zero`, `one_le_of_ne_zero` and
`mul_le_mul_right`.
-/
theorem le_mul_right (a b : ℕ) (h : a * b ≠ 0) : a ≤ a * b := by
  sorry

end MyNat
