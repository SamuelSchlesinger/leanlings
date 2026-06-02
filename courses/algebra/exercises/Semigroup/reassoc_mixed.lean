import Semigroup.reassoc5

namespace Algebra

theorem reassoc_mixed {α : Type _} [Semigroup α] (a b c d : α) : a * (b * c) * d = a * (b * (c * d)) := by
  sorry

end Algebra
