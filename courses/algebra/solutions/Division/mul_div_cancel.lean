import Division.one_div

namespace Algebra

theorem mul_div_cancel {G : Type _} [Group G] (a b : G) : a * b / b = a := by
  rw [div_eq, mul_assoc, Group.mul_inv_cancel, mul_one]

end Algebra
