import Group.mul_inv_rev

namespace Algebra

theorem inv_inj {G : Type _} [Group G] (a b : G) (h : a⁻¹ = b⁻¹) : a = b := by
  rw [← inv_inv a, h, inv_inv]

end Algebra
