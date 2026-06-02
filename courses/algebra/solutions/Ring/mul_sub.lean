import Ring.sub_zero

namespace Algebra

theorem mul_sub {R : Type _} [Ring R] (a b c : R) : a * (b - c) = a * b - a * c := by
  rw [sub_eq, Ring.left_distrib, mul_neg, ← sub_eq]

end Algebra
