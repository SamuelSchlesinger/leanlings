import Ring.neg_add

namespace Algebra

theorem sub_self {R : Type _} [Ring R] (a : R) : a - a = 0 := by
  rw [sub_eq, add_neg_cancel]

end Algebra
