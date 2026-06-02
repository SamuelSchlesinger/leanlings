import Hom.map_mul_inv

namespace Algebra

theorem map_div {G H : Type _} [Group G] [Group H] (f : GroupHom G H) (a b : G) : f.toFun (a / b) = f.toFun a / f.toFun b := by
  sorry

end Algebra
