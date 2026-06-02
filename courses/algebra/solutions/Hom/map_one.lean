import Division.div_mul_cancel

namespace Algebra

theorem map_one {G H : Type _} [Group G] [Group H] (f : GroupHom G H) : f.toFun 1 = 1 := by
  have h : f.toFun 1 * f.toFun 1 = f.toFun 1 * 1 := by
    rw [← f.map_mul, one_mul, mul_one]
  exact mul_left_cancel _ _ _ h

end Algebra
