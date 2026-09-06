import Hom.map_mul_inv

namespace Algebra

/- # A derived operation is preserved too

Division is not an extra field of `GroupHom`. Expand division on both sides,
then combine preservation of multiplication and inverses. The result follows
from the original multiplication law because the group axioms characterize the
derived operations.
-/
theorem map_div {G H : Type _} [Group G] [Group H] (f : GroupHom G H) (a b : G) : f.toFun (a / b) = f.toFun a / f.toFun b := by
  sorry

end Algebra
