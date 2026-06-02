import Group.inv_inj

namespace Algebra

theorem inv_mul_cancel_right {G : Type _} [Group G] (a b : G) : a * b⁻¹ * b = a := by
  rw [mul_assoc, Group.inv_mul_cancel, mul_one]

end Algebra
