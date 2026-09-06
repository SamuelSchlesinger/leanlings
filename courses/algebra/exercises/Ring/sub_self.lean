import Ring.neg_add

namespace Algebra

/- # Subtraction is already defined

Expand subtraction with `sub_eq`. The goal becomes an additive inverse law that
you have proved. The theorem is about every ring, so numerical evaluation is
not available; the definition and the abstract laws suffice.
-/
theorem sub_self {R : Type _} [Ring R] (a : R) : a - a = 0 := by
  sorry

end Algebra
