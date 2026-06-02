import Semigroup.reassoc

namespace Algebra

theorem reassoc_back {α : Type _} [Semigroup α] (a b c d : α) : a * (b * (c * d)) = a * b * c * d := by
  sorry

end Algebra
