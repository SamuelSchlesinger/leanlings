import Group.mul_left_eq_self

namespace Algebra

/- # Read the parentheses before canceling

The expression starts with a conjugate `g * a * g⁻¹`, then multiplies by `g`.
Reassociate to expose the final inverse pair. You can also recognize the entire
goal as an instance of a cancellation theorem already proved, with `g * a` as
one input.
-/
theorem conj_cancel {G : Type _} [Group G] (g a : G) : g * a * g⁻¹ * g = g * a := by
  sorry

end Algebra
