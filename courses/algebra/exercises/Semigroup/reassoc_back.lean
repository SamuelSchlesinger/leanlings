import Semigroup.reassoc

namespace Algebra

/- # Move the parentheses to the left

This reverses the preceding exercise. Remember that `a * b * c * d` means `((a
* b) * c) * d`. Choose a direction for associativity and check the goal after
each rewrite. The factors must remain in the order `a`, `b`, `c`, `d`.
-/
theorem reassoc_back {α : Type _} [Semigroup α] (a b c d : α) : a * (b * (c * d)) = a * b * c * d := by
  sorry

end Algebra
