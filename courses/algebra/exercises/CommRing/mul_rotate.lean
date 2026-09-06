/- # Rotate factors using the new law

A commutative ring adds `CommRing.mul_comm : a * b = b * a`.
The goal moves the first factor past the remaining two. Reassociate
to regard those two as a single element, then commute the appropriate
product. This is where the ring theory gains rearrangements that were
unavailable in the preceding unit.
-/
import Ring.sub_mul

namespace Algebra

theorem mul_rotate {R : Type _} [CommRing R] (a b c : R) : a * b * c = b * c * a := by
  sorry

end Algebra
