import Monoid.id_unique_right

namespace Algebra

theorem one_idempotent {M : Type _} [Monoid M] : (1 : M) * 1 = 1 := by
  rw [mul_one]

end Algebra
