import CommRing.mul_rotate

namespace Algebra

theorem sq_expand {R : Type _} [CommRing R] (a b : R) : (a + b) * (a + b) = a * a + a * b + (a * b + b * b) := by
  rw [mul_add_mul, CommRing.mul_comm b a]

end Algebra
