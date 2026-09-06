import Group.mul_right_cancel

namespace Algebra

/- # Undoing the undo returns the original action

Both `a⁻¹⁻¹` and `a` undo `a⁻¹`. Compare these inverse equations by
cancellation, or insert an inverse pair in a `calc` chain. Do not assume the
conclusion as a simplification rule: this is the step that establishes it for
later exercises.
-/
theorem inv_inv {G : Type _} [Group G] (a : G) : a⁻¹⁻¹ = a := by
  sorry

end Algebra
