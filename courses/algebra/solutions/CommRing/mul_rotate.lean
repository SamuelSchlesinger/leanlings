import Ring.sub_mul

namespace Algebra

theorem mul_rotate {R : Type _} [CommRing R] (a b c : R) : a * b * c = b * c * a := by
  rw [mul_assoc, CommRing.mul_comm]

end Algebra
