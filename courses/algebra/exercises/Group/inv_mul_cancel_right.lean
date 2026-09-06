import Group.mul_inv_cancel_left

namespace Algebra

/- # Cancel an inverse pair on the right

Lean reads `a * b⁻¹ * b` as `(a * b⁻¹) * b`. Reassociate to expose `b⁻¹ * b`,
then simplify. The inverse law removes a neighboring pair; it does not permit
moving either factor past `a`.
-/
theorem inv_mul_cancel_right {G : Type _} [Group G] (a b : G) : a * b⁻¹ * b = a := by
  sorry

end Algebra
