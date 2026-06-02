import Ring.mul_sub

namespace Algebra

theorem sub_mul {R : Type _} [Ring R] (a b c : R) : (a - b) * c = a * c - b * c := by
  rw [sub_eq, Ring.right_distrib, neg_mul, ← sub_eq]

end Algebra
