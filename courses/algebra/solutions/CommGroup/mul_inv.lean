import Group.conj_cancel

namespace Algebra

theorem mul_inv {G : Type _} [CommGroup G] (a b : G) : (a * b)⁻¹ = a⁻¹ * b⁻¹ := by
  rw [mul_inv_rev, CommGroup.mul_comm]

end Algebra
