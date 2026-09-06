import Group.mul_eq_one_of_eq_inv

namespace Algebra

/- # When an action changes nothing

Rewrite the right side as `a * 1`. The hypothesis then equates two products
with the same left factor, so left cancellation identifies `b`. This is a
useful proof pattern: insert an identity to turn an unfamiliar equation into a
cancellation task.
-/
theorem mul_right_eq_self {G : Type _} [Group G] (a b : G) (h : a * b = a) : b = 1 := by
  sorry

end Algebra
