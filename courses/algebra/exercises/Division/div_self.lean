/- Division world.
   In a group, `a / b` is notation for `a * b⁻¹`. Unfold it with
   `div_eq : a / b = a * b⁻¹`, then use the group lemmas you already have. -/
import CommGroup.mul_mul_mul_comm

namespace Algebra

theorem div_self {G : Type _} [Group G] (a : G) : a / a = 1 := by
  sorry

end Algebra
