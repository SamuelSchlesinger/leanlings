import Ring.sub_self

namespace Algebra

/- # Subtracting zero changes nothing

Expand subtraction, simplify the negative of zero, and remove the added zero.
This short chain is useful practice distinguishing a definition (`sub_eq`) from
the theorems used after unfolding it.
-/
theorem sub_zero {R : Type _} [Ring R] (a : R) : a - 0 = a := by
  sorry

end Algebra
