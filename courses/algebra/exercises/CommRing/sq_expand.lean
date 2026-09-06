import CommRing.mul_rotate

namespace Algebra

/- # The square formula needs commutativity

First expand with the ring theorem `mul_add_mul`. The two middle terms are
initially `b * a` and `a * b`; multiplication is now commutative, so they can
be identified. The statement uses two copies of `a * b` instead of a numeral
coefficient, keeping the required notation minimal.
-/
theorem sq_expand {R : Type _} [CommRing R] (a b : R) : (a + b) * (a + b) = a * a + a * b + (a * b + b * b) := by
  sorry

end Algebra
