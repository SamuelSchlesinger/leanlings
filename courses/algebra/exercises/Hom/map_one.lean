/- Homomorphism world.
   A `GroupHom G H` bundles a function `f.toFun` with the law
   `f.map_mul : f.toFun (a * b) = f.toFun a * f.toFun b`. Here you prove that
   homomorphisms also preserve `1` and inverses. -/
import Division.div_mul_cancel

namespace Algebra

theorem map_one {G H : Type _} [Group G] [Group H] (f : GroupHom G H) : f.toFun 1 = 1 := by
  sorry

end Algebra
