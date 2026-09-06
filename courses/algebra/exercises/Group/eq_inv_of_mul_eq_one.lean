import Group.inv_inj

namespace Algebra

/- # Recognize an inverse by its product

The equation `a * b = 1` says that `b` undoes `a` on the right. Compare it with
the defining equation for `a⁻¹`. Multiplying by `a⁻¹` on the left, or using
cancellation, proves uniqueness of that inverse.
-/
theorem eq_inv_of_mul_eq_one {G : Type _} [Group G] (a b : G) (h : a * b = 1) : b = a⁻¹ := by
  sorry

end Algebra
