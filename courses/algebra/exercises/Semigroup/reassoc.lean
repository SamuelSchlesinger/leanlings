/- # Associativity changes the grouping

A semigroup is a magma whose operation is associative. Its new law is
`mul_assoc : a * b * c = a * (b * c)`. This name is available
unqualified in the `Algebra` namespace.

The goal has four factors. Read its left side as `((a * b) * c) * d`
and use associativity to match the right side. Inspect the goal after
each rewrite; a product such as `a * b` can itself be an input to the law.
-/
import Magma.bool_assoc

namespace Algebra

theorem reassoc {α : Type _} [Semigroup α] (a b c d : α) : a * b * c * d = a * (b * (c * d)) := by
  sorry

end Algebra
