/- Commutative group world.
   Everything from groups, plus `CommGroup.mul_comm : a * b = b * a`. -/
import Group.conj_cancel

namespace Algebra

theorem mul_inv {G : Type _} [CommGroup G] (a b : G) : (a * b)⁻¹ = a⁻¹ * b⁻¹ := by
  sorry

end Algebra
