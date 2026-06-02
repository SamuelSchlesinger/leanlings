import Division.mul_div_cancel

namespace Algebra

theorem div_mul_cancel {G : Type _} [Group G] (a b : G) : a / b * b = a := by
  rw [div_eq, mul_assoc, Group.inv_mul_cancel, mul_one]

end Algebra
