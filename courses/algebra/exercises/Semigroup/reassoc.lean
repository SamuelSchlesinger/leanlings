/- Semigroup world.
   A semigroup is a magma whose operation is associative. The one new fact is
   `mul_assoc : a * b * c = a * (b * c)` (available unqualified). -/
import Magma.bool_assoc

namespace Algebra

theorem reassoc {α : Type _} [Semigroup α] (a b c d : α) : a * b * c * d = a * (b * (c * d)) := by
  sorry

end Algebra
