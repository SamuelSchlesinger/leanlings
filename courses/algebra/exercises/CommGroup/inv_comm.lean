import CommGroup.mul_right_comm

namespace Algebra

/- # Laws apply to compound terms too

An inverse is still an element of the same commutative group. Apply
commutativity to the two elements `a⁻¹` and `b⁻¹`. There is no need to expand
an inverse or prove another inverse law.
-/
theorem inv_comm {G : Type _} [CommGroup G] (a b : G) : a⁻¹ * b⁻¹ = b⁻¹ * a⁻¹ := by
  sorry

end Algebra
