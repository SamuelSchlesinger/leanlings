import Group.mul_eq_one_of_eq_inv

namespace Algebra

theorem mul_right_eq_self {G : Type _} [Group G] (a b : G) (h : a * b = a) : b = 1 := by
  have h2 : a * b = a * 1 := by rw [mul_one]; exact h
  exact mul_left_cancel a b 1 h2

end Algebra
