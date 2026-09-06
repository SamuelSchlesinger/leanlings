import Group.mul_left_cancel

namespace Algebra

/- # The side of cancellation matters

The shared factor is now on the right. Undo it with `c⁻¹` on the right of both
sides of `h`. Left multiplication by `c⁻¹` would not expose a canceling pair in
an arbitrary group. Plan the corresponding `calc` chain before writing the
rewrites.
-/
theorem mul_right_cancel {G : Type _} [Group G] (a b c : G) (h : a * c = b * c) : a = b := by
  sorry

end Algebra
