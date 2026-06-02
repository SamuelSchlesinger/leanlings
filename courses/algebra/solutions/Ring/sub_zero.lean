import Ring.sub_self

namespace Algebra

theorem sub_zero {R : Type _} [Ring R] (a : R) : a - 0 = a := by
  rw [sub_eq, neg_zero, Ring.add_zero]

end Algebra
