/- Group world.
   A group adds inverses, via `Group.inv_mul_cancel : a⁻¹ * a = 1` and
   `Group.mul_inv_cancel : a * a⁻¹ = 1`. Naming convention: axioms outside the
   multiplicative core are written qualified (`Group....`, `CommGroup....`,
   `Ring....`); `mul_assoc`, `one_mul`, `mul_one` are available unqualified. -/
import Monoid.bool_one

namespace Algebra

theorem inv_mul_cancel_left {G : Type _} [Group G] (a b : G) : a⁻¹ * (a * b) = b := by
  sorry

end Algebra
