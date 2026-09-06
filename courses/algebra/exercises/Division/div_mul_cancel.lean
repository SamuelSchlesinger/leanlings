import Division.mul_div_cancel

namespace Algebra

/- # Undo division by multiplying back

Expand `(a / b) * b`, then locate the pair `b⁻¹ * b`. Compare the order with
the previous exercise. Both laws hold in any group because division was defined
using the inverse on the right.
-/
theorem div_mul_cancel {G : Type _} [Group G] (a b : G) : a / b * b = a := by
  sorry

end Algebra
