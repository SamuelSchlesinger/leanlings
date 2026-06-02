import Division.div_self

namespace Algebra

theorem div_one {G : Type _} [Group G] (a : G) : a / 1 = a := by
  rw [div_eq, inv_one, mul_one]

end Algebra
