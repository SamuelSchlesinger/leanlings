import Semigroup.assoc_symm

namespace Algebra

theorem reassoc5 {α : Type _} [Semigroup α] (a b c d e : α) : a * b * c * d * e = a * (b * (c * (d * e))) := by
  sorry

end Algebra
