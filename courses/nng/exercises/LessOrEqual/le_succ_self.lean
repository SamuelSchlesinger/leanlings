-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import LessOrEqual.zero_le

namespace MyNat

/-
If you `use` the wrong number, you get stuck with a goal you can't prove.
What number will you `use` here?
-/
/-- If $x$ is a number, then $x \le \operatorname{succ}(x)$. -/
theorem le_succ_self (x : ℕ) : x ≤ succ x := by
  sorry

end MyNat
