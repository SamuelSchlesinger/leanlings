/- Commutative ring world.
   Everything from rings, plus `CommRing.mul_comm : a * b = b * a`. -/
import Ring.sub_mul

namespace Algebra

theorem mul_rotate {R : Type _} [CommRing R] (a b c : R) : a * b * c = b * c * a := by
  sorry

end Algebra
