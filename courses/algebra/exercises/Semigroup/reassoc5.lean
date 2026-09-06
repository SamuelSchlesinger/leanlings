import Semigroup.assoc_symm

namespace Algebra

/- # Choose a consistent normal form

There are now five factors, but the same law suffices. Aim to put every
parenthesis on the right. After each rewrite, count how many left-grouped
products remain. You can write the steps individually before trying repeated
rewriting; explain why the process stops for this expression.
-/
theorem reassoc5 {α : Type _} [Semigroup α] (a b c d e : α) : a * b * c * d * e = a * (b * (c * (d * e))) := by
  sorry

end Algebra
