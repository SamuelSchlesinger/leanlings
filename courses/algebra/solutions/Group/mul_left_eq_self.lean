import Group.mul_right_eq_self

namespace Algebra

theorem mul_left_eq_self {G : Type _} [Group G] (a b : G) (h : a * b = b) : a = 1 := by
  have h2 : a * b = 1 * b := by rw [one_mul]; exact h
  exact mul_right_cancel a 1 b h2

end Algebra
