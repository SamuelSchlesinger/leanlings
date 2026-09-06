import Group.mul_right_eq_self

namespace Algebra

/- # Insert the identity on the matching side

Rewrite the right side as `1 * b`, then cancel the shared right factor. Compare
this with the previous exercise: the goal is similar, but the position of the
shared factor selects the cancellation theorem. No assumption that `b` is
nonzero is needed in a group.
-/
theorem mul_left_eq_self {G : Type _} [Group G] (a b : G) (h : a * b = b) : a = 1 := by
  sorry

end Algebra
