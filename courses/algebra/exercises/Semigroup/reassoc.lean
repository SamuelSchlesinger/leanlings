import Magma.bool_assoc

namespace Algebra

theorem reassoc {α : Type _} [Semigroup α] (a b c d : α) : a * b * c * d = a * (b * (c * d)) := by
  sorry

end Algebra
