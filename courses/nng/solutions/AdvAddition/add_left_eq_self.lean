-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvAddition.add_left_cancel

namespace MyNat

/-- $x + y = y\implies x=0.$ -/
theorem add_left_eq_self (x y : ℕ) : x + y = y → x = 0 := by
  intro h
  rewrite (config := { occs := .pos [2] }) [← zero_add y] at h
  have h := add_right_cancel _ _ _ h
  exact h

end MyNat
