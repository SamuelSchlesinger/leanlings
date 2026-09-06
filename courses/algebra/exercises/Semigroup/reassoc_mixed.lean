import Semigroup.reassoc5

namespace Algebra

/- # Reassociate inside a larger expression

The inner product `b * c` is grouped correctly relative to `a`, but the final
factor `d` is still outside. First apply associativity with `b * c` as a single
input, then inspect the remaining inner grouping. A rewrite can act inside an
expression as well as at its outermost operation.
-/
theorem reassoc_mixed {α : Type _} [Semigroup α] (a b c d : α) : a * (b * c) * d = a * (b * (c * d)) := by
  sorry

end Algebra
