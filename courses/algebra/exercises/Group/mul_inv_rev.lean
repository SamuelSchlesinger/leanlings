import Group.inv_eq_of_mul_eq_one

namespace Algebra

/- # Undo a composite in reverse order

To undo two successive actions, undo the second and then the first. Show that
`b⁻¹ * a⁻¹` has product `1` with `a * b`, then use uniqueness of the inverse.
Associativity exposes the two inverse pairs without swapping factors. Explain
where a proof of the reversed formula `a⁻¹ * b⁻¹` would get stuck.
-/
theorem mul_inv_rev {G : Type _} [Group G] (a b : G) : (a * b)⁻¹ = b⁻¹ * a⁻¹ := by
  sorry

end Algebra
