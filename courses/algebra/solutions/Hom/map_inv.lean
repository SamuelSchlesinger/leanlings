import Hom.map_one

namespace Algebra

theorem map_inv {G H : Type _} [Group G] [Group H] (f : GroupHom G H) (a : G) : f.toFun a⁻¹ = (f.toFun a)⁻¹ := by
  have h : f.toFun a * f.toFun a⁻¹ = 1 := by
    rw [← f.map_mul, Group.mul_inv_cancel, map_one]
  exact eq_inv_of_mul_eq_one (f.toFun a) (f.toFun a⁻¹) h

end Algebra
