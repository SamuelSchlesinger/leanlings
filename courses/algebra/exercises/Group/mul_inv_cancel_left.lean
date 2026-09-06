import Group.inv_mul_cancel_left

namespace Algebra

/- # Expose the inverse pair

The goal contains `a` and its inverse, but their product is hidden by the
parentheses. Group these two factors together, apply the appropriate inverse
law, then remove the identity. Compare the order of the pair with the preceding
exercise before choosing the law.
-/
theorem mul_inv_cancel_left {G : Type _} [Group G] (a b : G) : a * (a⁻¹ * b) = b := by
  sorry

end Algebra
