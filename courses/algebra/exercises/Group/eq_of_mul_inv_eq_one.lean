import Group.mul_inv_rev

namespace Algebra

/- # Equality detected by an inverse product

The equation says `a` followed by the inverse of `b` has no effect. Turn it
into equality of `a` and `b` by multiplying on the right by `b`, or use inverse
uniqueness and `inv_inv`. Locate the canceling pair before choosing your route.
-/
theorem eq_of_mul_inv_eq_one {G : Type _} [Group G] (a b : G) (h : a * b⁻¹ = 1) : a = b := by
  sorry

end Algebra
