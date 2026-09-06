import Ring.add_neg_cancel

namespace Algebra

/- # Translate group reasoning into addition

Undo the common summand `a` by adding `-a` on the left of both sides. The proof
follows the group cancellation argument with `0` in place of `1`. Use the
qualified ring laws so Lean selects addition rather than the multiplicative
structure.
-/
theorem add_left_cancel {R : Type _} [Ring R] (a b c : R) (h : a + b = a + c) : b = c := by
  sorry

end Algebra
