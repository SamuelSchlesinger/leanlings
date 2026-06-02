import Group.eq_inv_of_mul_eq_one

namespace Algebra

theorem inv_eq_of_mul_eq_one {G : Type _} [Group G] (a b : G) (h : a * b = 1) : a⁻¹ = b := by
  exact (eq_inv_of_mul_eq_one a b h).symm

end Algebra
