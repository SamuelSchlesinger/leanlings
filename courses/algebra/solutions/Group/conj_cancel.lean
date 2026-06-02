import Group.mul_left_eq_self

namespace Algebra

theorem conj_cancel {G : Type _} [Group G] (g a : G) : g * a * g⁻¹ * g = g * a := by
  rw [mul_assoc, Group.inv_mul_cancel, mul_one]

end Algebra
