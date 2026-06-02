import Monoid.bool_one

namespace Algebra

theorem inv_mul_cancel_left {G : Type _} [Group G] (a b : G) : a⁻¹ * (a * b) = b := by
  rw [← mul_assoc, Group.inv_mul_cancel, one_mul]

end Algebra
