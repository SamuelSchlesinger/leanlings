-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.mul_assoc

namespace MyNat

/-
Mathematicians sometimes debate what `0 ^ 0` is;
the answer depends, of course, on your definitions. In this
game, `0 ^ 0 = 1`. See if you can prove it.

Check out the *Pow* tab in your list of theorems
to see the new proofs which are available.
-/
/-- $0 ^ 0 = 1$ -/
theorem zero_pow_zero : (0 : ℕ) ^ 0 = 1 := by
  sorry

end MyNat
