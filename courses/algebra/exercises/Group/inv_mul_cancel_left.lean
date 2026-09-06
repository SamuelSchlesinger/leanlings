/- # Inverses undo an action

A group adds inverses, with `Group.inv_mul_cancel : a⁻¹ * a = 1`
and `Group.mul_inv_cancel : a * a⁻¹ = 1`.

Group `a⁻¹` with `a`, apply the inverse law, then remove the identity.
The laws are written qualified because similar names will appear in
rings and fields; `mul_assoc`, `one_mul`, and `mul_one` remain available
unqualified. Keep the factors in their original order.
-/
import Monoid.bool_one

namespace Algebra

theorem inv_mul_cancel_left {G : Type _} [Group G] (a b : G) : a⁻¹ * (a * b) = b := by
  sorry

end Algebra
