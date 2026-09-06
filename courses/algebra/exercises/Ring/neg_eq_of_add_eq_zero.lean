import Ring.neg_zero

namespace Algebra

/- # Recognize a negative by a zero sum

If `a + b = 0`, then `b` is an additive inverse of `a`. Add `-a` to both sides
and simplify, or compare with the canonical inverse equation using
cancellation. This characterization will shorten proofs about negatives of
compound expressions.
-/
theorem neg_eq_of_add_eq_zero {R : Type _} [Ring R] (a b : R) (h : a + b = 0) : -a = b := by
  sorry

end Algebra
