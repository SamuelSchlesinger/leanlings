-- Adapted from the Natural Number Game (leanprover-community/NNG4), Apache-2.0.
-- Modified for leanlings; see courses/nng/NOTICE.
import AdvMultiplication.mul_left_ne_zero

namespace MyNat

/-
Multiplication usually makes a number bigger, but multiplication by zero can make
it smaller. Thus many lemmas about inequalities and multiplication need the
hypothesis `a ≠ 0`. Here is a key lemma that enables us to use this hypothesis.
To help us with the proof, we can use the `tauto` tactic. Click on the tactic's name
on the right to see what it does.
-/
theorem eq_succ_of_ne_zero (a : ℕ) (ha : a ≠ 0) : ∃ n, a = succ n := by
  sorry

end MyNat
