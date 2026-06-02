import Hom.map_inv

namespace Algebra

theorem map_mul_inv {G H : Type _} [Group G] [Group H] (f : GroupHom G H) (a b : G) : f.toFun (a * b⁻¹) = f.toFun a * (f.toFun b)⁻¹ := by
  rw [f.map_mul, map_inv]

end Algebra
