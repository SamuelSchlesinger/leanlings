import Hom.map_one

namespace Algebra

theorem map_inv {G H : Type _} [Group G] [Group H] (f : GroupHom G H) (a : G) : f.toFun a⁻¹ = (f.toFun a)⁻¹ := by
  sorry

end Algebra
