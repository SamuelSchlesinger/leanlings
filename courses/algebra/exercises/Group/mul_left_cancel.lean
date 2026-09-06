import Group.inv_one

namespace Algebra

/- # Undo a shared action

If applying `a` to `b` and to `c` gives the same result, undo that action on
both sides by multiplying on the left by `a⁻¹`. A `calc` chain can start at
`b`, pass through `a⁻¹ * (a * b)`, use `h`, and end at `c`. Keep the
intermediate expressions visible so each equality has a named justification.
-/
theorem mul_left_cancel {G : Type _} [Group G] (a b c : G) (h : a * b = a * c) : b = c := by
  sorry

end Algebra
