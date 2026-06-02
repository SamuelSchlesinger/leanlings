import Semigroup.reassoc_back

namespace Algebra

theorem reassoc_pair {α : Type _} [Semigroup α] (a b c d : α) : a * b * (c * d) = a * b * c * d := by
  rw [← mul_assoc]

end Algebra
