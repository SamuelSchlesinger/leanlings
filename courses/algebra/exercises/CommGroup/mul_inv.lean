/- # Commutativity changes the inverse formula

A commutative group adds `CommGroup.mul_comm : a * b = b * a`.
You have already proved that the inverse of a product reverses its
factors. Here you may commute the resulting inverse factors to obtain
the order in the goal. Identify exactly which step needs the new law.
-/
import Group.conj_cancel

namespace Algebra

theorem mul_inv {G : Type _} [CommGroup G] (a b : G) : (a * b)⁻¹ = a⁻¹ * b⁻¹ := by
  sorry

end Algebra
