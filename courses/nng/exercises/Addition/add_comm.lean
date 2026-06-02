-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import Addition.succ_add

namespace MyNat

/-
[boss battle music]

You've already proved `zero_add` and `succ_add`; with the axioms `add_zero`
and `add_succ`, those should be enough.
-/
/-- On the set of natural numbers, addition is commutative.
In other words, if `a` and `b` are arbitrary natural numbers, then
$a + b = b + a$. -/
theorem add_comm (a b : ℕ) : a + b = b + a := by
  sorry

end MyNat
