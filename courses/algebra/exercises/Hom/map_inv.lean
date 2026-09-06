import Hom.map_one

namespace Algebra

/- # Map an inverse equation

Start with an inverse equation in the source group `G`. Applying `f.toFun`,
using `f.map_mul`, and using `map_one` gives an inverse equation in the target
group `H`. Uniqueness of inverses there identifies `f.toFun a⁻¹`. Track which
group each operation belongs to.
-/
theorem map_inv {G H : Type _} [Group G] [Group H] (f : GroupHom G H) (a : G) : f.toFun a⁻¹ = (f.toFun a)⁻¹ := by
  sorry

end Algebra
