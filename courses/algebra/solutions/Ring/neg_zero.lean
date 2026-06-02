import Ring.mul_add_mul

namespace Algebra

theorem neg_zero {R : Type _} [Ring R] : -(0 : R) = 0 := by
  have h := Ring.neg_add_cancel (0 : R)
  rw [Ring.add_zero] at h
  exact h

end Algebra
