-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Multiplication.succ_mul

namespace MyNat

/-
The first sub-boss of Multiplication World is `mul_comm x y : x * y = y * x`.

When you've proved this theorem we will have "spare" proofs
such as `zero_mul`, which is now easily deducible from `mul_zero`.
But we'll keep hold of these proofs anyway, because it's convenient
to have exactly the right tool for a job.
-/
/-- Multiplication is commutative. -/
theorem mul_comm
    (a b : ℕ) : a * b = b * a := by
  sorry

end MyNat
